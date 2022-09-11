# Docker Postgresql and Nexcloud instructions
## Installing Docker
 - [Docker Windows Instructions](https://docs.docker.com/desktop/install/windows-install/)
 - [Docker Linux Instructions](https://docs.docker.com/desktop/install/linux-install/)
  
## Running the docker container
Run the following in your terminal/powershell/vscode terminal
```
docker-compose -f docker-compose-psql.yml -f docker-compose-nextcloud.yml up
```
You can access nextcloud with http://localhost:8080/
You can access psql with localhost:5432

## Shutting down the docker container
```
*Press ctrl+c or cmd+c
docker-compose -f docker-compose-psql.yml -f docker-compose-nextcloud.yml down
```
## Information on the containers
#### Nextcloud
When you install nextcloud you will need to create an admin account.
Set the Username and Password as follows:
```
Eyenapple:ThisIsATestAccount!
```

Nextcloud has a permenent data volume created that will run in the background. If for some reason this service gets messed up during testing, open your docker client and go to the volumes tabs. Make sure the docker containers are not running. Select both eyenapple-docker-* volumes and delete them.