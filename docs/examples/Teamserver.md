# Teamserver

The [teamserver](../../instances/teamserver.rb) instance is composed of some tools useful for collaborative tasks:
- The Metasploit RPC server
- The Armitage teamserver
- The BeEF server
- The Faraday server

The `teamserver` needs `postgresql` and `couchdb` databases, for respectively `metasploit` and `faraday`. This is the role of the [database](../../instances/database.rb) instance.  

The [teamserver.pentestrc](../../examples/teamserver.pentestrc) example use this two instances to provision the teamserver. Copy and modify it for you needs and set the `PENTESTRC` env var to your rc file. Then, run `vagrant status`:
```
$ vagrant status
Current machine states:

database                  not created (virtualbox)
teamserver                not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

Now run `vagrant up`, the `database` will be created and provisioned, followed by the `teamserver`.

Once two instances are provisioned, the `teamserver` comes with a tmux script that will start all services in a tmux session. It provides you facilities to debug and adapt all scripts/services inside the `teamserver`:
```
$ vagrant ssh teamserver
# ./ts
```

All this works is an adaptation for `pentest-env` from my [lab](https://github.com/Sliim/pentest-lab), see [teamserver lab documentation](https://github.com/Sliim/pentest-lab/blob/master/docs/teamserver.md) for more info.
