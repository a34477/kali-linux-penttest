#!/bin/bash

set -e

OVA_FILE=
VMNAME=
OSTYPE=
DISK_IMG=
OVF_FILE=
QCOW_FILE=
VDI_FILE=

function download_vulnhub_image {
    OVA_FILE=$(basename $1)
    VMNAME=$(echo "$OVA_FILE" | sed "s/\.ova//")
    BUILDDIR="build/$VMNAME"

    if test -f "$VMNAME.box"; then
        echo "$VMNAME.box seems to be already packaged.. skipping."
        exit 1
    fi

    mkdir -p "$BUILDDIR"

    if test -f "$OVA_FILE"; then
        echo "$OVA_FILE already downloaded.. skipping."
    else
        echo "Downloading https://download.vulnhub.com/$1..."
        wget "https://download.vulnhub.com/$1"
    fi
}

function check_vulnhub_image {
    if [[ $(echo $1 | wc -c) == "41" ]]; then
        echo "Checking sha1sum.."
        sum=$(sha1sum $OVA_FILE | cut -d" " -f1)
    else
        echo "Checking md5sum.."
        sum=$(md5sum $OVA_FILE | cut -d" " -f1)
    fi

    if [[ $sum != $1 ]]; then
        echo "Checksums mismatch for $2 ($sum instead of $1)"
        exit 2
    fi
}

function extract_ova {
    echo "Extracting $OVA_FILE ova file.."
    tar xvf $OVA_FILE -C $BUILDDIR
    DISK_IMG=$(ls $BUILDDIR/*.vmdk)
    OVF_FILE=$(ls $BUILDDIR/*.ovf)
    echo "Disk image: $DISK_IMG"
    echo "OVF File: $OVF_FILE"
}

function convert_vmdk_to_qcow {
    QCOW_FILE=$(echo "$DISK_IMG" | sed "s/\.[a-zA-Z0-9]*$//").qcow2
    echo "Converting $DISK_IMG to $QCOW_FILE..."
    qemu-img convert -f vmdk -O qcow2 "$DISK_IMG" "$QCOW_FILE"
}

function convert_qcow_to_vdi {
    VDI_FILE=$(echo "$QCOW_FILE" | sed "s/\.[a-zA-Z0-9]*$//").vdi
    echo "Converting $QCOW_FILE to $VDI_FILE..."
    qemu-img convert -f qcow2 -O vdi "$QCOW_FILE" "$VDI_FILE"
    echo "done."
}

function add_interfaces_to_img {
    echo "Mouting image to add new interfaces..."
    mkdir -p "mountpoint/$VMNAME"
    guestmount -a "$QCOW_FILE" -i -o uid=1000 -o gid=1000 "mountpoint/$VMNAME"
    echo -e "auto eth1\niface eth1 inet dhcp\nauto eth2\niface eth2 inet dhcp" >> "mountpoint/$VMNAME/etc/network/interfaces"
    cat "mountpoint/$VMNAME/etc/network/interfaces"
    echo "Unmouting image..."
    guestunmount "mountpoint/$VMNAME/"
}

function create_vm {
    if test -n "$OVF_FILE"; then
        OSTYPE=$(grep -Eo "OSType=\"([A-Za-z0-9_-]+)\"" "$OVF_FILE" | perl -lne 'print $1 if /OSType=\"([A-Za-z0-9_\-]+)\"/')
    fi

    if test -z $OSTYPE; then
        OSTYPE=Linux
    fi

    VBoxManage createvm --register --name "$VMNAME"
    cp "$VDI_FILE" "$HOME/VirtualBox VMs/$VMNAME/$VMNAME.vdi"
    VBoxManage storagectl "$VMNAME" --name "IDE Controller" --add ide
    echo Set OS type: $OSTYPE..
    VBoxManage modifyvm "$VMNAME" --ostype $OSTYPE
    echo Attach disk image..
    VBoxManage modifyvm "$VMNAME" --hda "$HOME/VirtualBox VMs/$VMNAME/$VMNAME.vdi"
    echo Set memory..
    VBoxManage modifyvm "$VMNAME" --memory 1024
    echo Set network adapter 1: nat
    VBoxManage modifyvm "$VMNAME" --nic1 nat
    echo done.
}

 function boot_vm {
    VBoxManage startvm "$VMNAME"
}

function destroy_vm {
    VBoxManage unregistervm "$VMNAME" --delete
}

function vagrant_package {
    vagrant package --base "$VMNAME" --output "$VMNAME.box"
}

function clean_files {
    echo Cleaning files...
    rm -rf "$BUILDDIR"
}

download_vulnhub_image $2
check_vulnhub_image $1
extract_ova
convert_vmdk_to_qcow
add_interfaces_to_img
convert_qcow_to_vdi
create_vm
clean_files
vagrant_package
destroy_vm
