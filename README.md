# Hashicorp vault in docker container 

## Default build 
Purpose of this repo is to enable you to quickly build vault for testing purposes.
You can choose to build image yourself 
```bash
docker build -t rafpe/vault:latest .
```

Once build you can just start the container. It uses supervisord to control 
the process so if you are interested in getting output within the logs you need
to make some tweaks. 
```bash
docker run -d -P --cap-add IPC_LOCK rafpe/vault:latest
```

The above command will get you Vault running with default store on file system
and TLS disabled on API tcp listener endpoint 

## Modyfing config files
If you would like to modify configuration - image exposes several volumes which
you can use. 

* /etc/vault
* /etc/supervisor
* /data

So in case you would like to modify vault config file you could use 
```bash 
docker run -d -v /path-to-file/vault.hcl:/etc/vault/vault.hcl -P --cap-add IPC_LOCK rafpe/vault:latest
```

The same applies for supervisord. 

Data volume is for scenarios i.e TLS certificates or other files you would use with vault 

Happy securing :) 
