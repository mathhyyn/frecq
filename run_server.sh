cd server
#docker container rm server
#docker image rm server-node
docker compose up
#cat ./server/facerecdb.dump | PGPASSWORD=postgres psql -h localhost -U postgres