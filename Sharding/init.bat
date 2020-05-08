docker-compose up -d
timeout /t 5
docker-compose exec config01 sh -c "mongo --port 27019 < /scripts/init-configserver.js"
docker-compose exec shard01a sh -c "mongo --port 27018 < /scripts/init-shard01.js"
docker-compose exec shard02a sh -c "mongo --port 27018 < /scripts/init-shard02.js"
docker-compose exec shard03a sh -c "mongo --port 27018 < /scripts/init-shard03.js"
timeout /t 20
docker-compose exec router01 sh -c "mongo < /scripts/init-router.js"
docker-compose exec router01 sh -c "mongo admin < /scripts/init-usr.js"