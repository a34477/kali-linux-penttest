# Pentest-env debugging

You can debug pentest-env with vagrant debugging!

Set `VAGRANT_LOG` environment variable to wanted log level.

To filter pentest-env logs:
```
tail -F vagrant-info| grep pentest-env/
```

In another terminal::
```
VAGRANT_LOG=info vagrant status 2>vagrant-info
```

