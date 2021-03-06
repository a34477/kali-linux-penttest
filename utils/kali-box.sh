# Script used to automate pentest-env boxes packaging for Kali linux
# See https://github.com/Sliim/pentest-env/blob/master/docs/About-boxes.md
# Source: https://gist.github.com/Sliim/f4b7ae150c4999a4241236ab9fbfb256
#
# First, you need to download and install Kali on a virtual machine
# When installed, mount Guest Additions CD images from VBox GUI, and run:
#
#   # wget https://raw.githubusercontent.com/Sliim/pentest-env/master/utils/kali-box.sh | bash
#
# Well, now your vm is ready to be packaged, shutdown and vagrant package ...
#

# Set Kali rolling repos
echo "deb     http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list

# Install Kernel headers
apt-get update && apt-get install -y linux-headers-$(uname -r)

# Need gcc and make to build guest additions
apt-get install -y gcc make

# Install Guest additions
mount /dev/cdrom /mnt
cp -r /mnt /root/tmp-ga
umount /mnt
cd /root/tmp-ga
./VBoxLinuxAdditions.run
cd; rm -rf /root/tmp-ga

# Deploy pentest-env key
test -d /root/.ssh || mkdir /root/.ssh
wget https://raw.githubusercontent.com/Sliim/pentest-env/master/ssh-keys/pentest-env.pub -O /root/.ssh/authorized_keys

# Enable SSH service
systemctl enable ssh

# Workaround for additional interfaces
cat <<EOF >> /etc/network/interfaces

# pentest-env: workaround for additional network interfaces
auto eth1
iface eth1 inet dhcp
auto eth2
iface eth2 inet dhcp

EOF
