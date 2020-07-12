docker rm $(docker stop $(docker ps -a -q  --filter ancestor=soorejjones/alohausermgmt --format="{{.ID}}"))
docker pull soorejjones/alohausermgmt:latest
docker run -d -p 80:8000 soorejjones/alohausermgmt