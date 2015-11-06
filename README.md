clone the repository with 

git clone https://github.com/sparklyballs/auroramon.git

cd auroramon

`docker build --rm=true -t sparklyballs/auroramon .`

`docker run -d --name=auroramon --net=host -v <path to data>:/nobody sparklyballs/auroramon`

`http://<your ip>:8080`
