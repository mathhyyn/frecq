cd server
#docker container rm server
#docker image rm server-node
docker compose up
#cat ./facerecdb.dump | PGPASSWORD=postgres psql -h localhost -d frecqdb -U frecquser -p 8008
