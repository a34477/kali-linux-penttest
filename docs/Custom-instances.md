# Write customized instances and targets

There is two types of machines in `pentest-env`, instances and targets.

Instances are virtual machines / containers with some tools, services to do some pentest tasks. They are located in the `instances/` directory, at the `pentest-env` root directory.

Targets are located in the `targets/` directory, generally these machines comes with some vulnerabilities to exploit.

Pentest-env allow you to create yours in your custom instances and targets directories. You can set these custom directories in your `pentestrc` with keys `instances_path` and `targets_path`:
```
instances_path: ~/.pentest.d/instances
targets_path: ~/.pentest.d/targets

instances:
  - docker-beef
  
targets:
  - vuln-server
```

### Writing an instance
Each instance file must contains a function named `instance` that take the vagrant configuration and the instance customiwations as argument.
This function must define a vagrant vm, with a unique name, and configure some providers, provisioning etc..

Example with a Docker instance `~/.pentest.d/instances/docker-beef.rb`:
```
def instance(vconfig, _custom)
  vconfig.vm.define 'docker-beef' do |beef|
    beef.vm.provider 'docker' do |d|
      d.image = 'malwarelu/beef'
      d.ports = ['3000:3000']
      d.name = 'pentest-env-beef'
    end
  end
end
```

### Writing a target
Targets works in the same way of Instances. The function name is not `instance` but `target`, this is the only difference.

Example with a virtualbox machine `~/.pentest.d/targets/vuln-server.rb`:
```
def target(vconfig, _custom)
  vconfig.vm.define 'vuln-server' do |target|
    target.vm.box = 'blackfin/vuln-server'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-vuln-server']
      v.customize ['modifyvm', :id, '--memory', 512]
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end

```

## Resources
Here is a list that can help you to build your targets:

- https://atlas.hashicorp.com/boxes/search
- http://www.vagrantbox.es/
- https://hub.docker.com/
- https://www.vulnhub.com/
- http://www.oldapps.com/
