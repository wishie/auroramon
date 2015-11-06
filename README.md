clone the repository with 

git clone 

cd auroramon

docker build --rm=true -t sparklyballs/auroramon

docker run -d --name=auroramon --net=host 
