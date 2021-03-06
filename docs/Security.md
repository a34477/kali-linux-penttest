# Securing the environment

Some default values can be dangerous if you expose your environment in hostile networks, here is some steps to harden your environment.  
See the [example pentestrc](../examples/secure-env.pentestrc) file.

## root password

The default root password is `toor`, we can change it with Chef:  
First we generate the password hash:
```
$ mkpasswd  -m sha-512 -S pentestenv -s <<< custom-password 
$6$pentestenv$2B8PIRYrG7XOMj8FQOHJ1hDMfniVVpgBVo70mes6mpTeNqApvCVUx6rS6gXojxLrsHqnwYavbJSjpd8HSUbHh1
```

Then, define the user password inside the `elite` cookbook:
```
kali:
  chef:
    recipes:
      - elite
    json:
      elite:
        users: [root]
        root:
          shell: /bin/bash
          password: $6$pentestenv$2B8PIRYrG7XOMj8FQOHJ1hDMfniVVpgBVo70mes6mpTeNqApvCVUx6rS6gXojxLrsHqnwYavbJSjpd8HSUbHh1
```

## Allowed SSH keys

The default allowed SSH private key to connect to the kali instance is public and can be found [here](https://raw.githubusercontent.com/Sliim/pentest-env/master/ssh-keys/pentest-env). Change it by:  

Generate a custom key:
```
$ ssh-keygen -f ssh-keys/custom-key
```
Copy your SSH public key (without type & label `cat ssh-keys/custom-key.pub|cut -d" " -f2`) and add it in your provisioning step:
```
kali:
  chef:
    recipes:
      - pentestenv::authorized_keys
    json:
      pentestenv:
        authorized_keys:
          root:
            - AAAAB3NzaC1yc2EAAAADA[....]RHazdIlN
```

After provisioning, the default private key will not be allowed to connect to the Kali instance, we need to use our new key:
```
kali:
  ssh:
    private_key_path: ssh-keys/custom-key
```

## Public network

Don't systematically connect your kali to public networks, only when required.
