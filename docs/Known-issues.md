# Known issues

### Hostonly on kali linux 1.0 fail

Hostonly connection will be reset at first vm creation. To resolve this, disconnect connection in gui mode and run in your vagrant directory:
```
vagrant reload kali
```

### GPG Error: KEYEXPIRED

If you have the following message when you run `apt-get update`:
```
W: A error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://security.kali.org kali/updates Release: The foll
owing signatures were invalid: KEYEXPIRED 1425567400 KEYEXPIRED 1425567400 KEYEXPIRED 1425567400
```

You need to update your `kali-archive-keyring`:
```
rm -rf /var/lib/apt/lists
apt-get update
apt-get install kali-archive-keyring
```
Source: https://forums.kali.org/showthread.php?24687-Problem-with-apt-get-update
