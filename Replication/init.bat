docker-compose up -d
timeout /t 5
docker-compose exec mongo1 sh -c "mongo < /scripts/init-rs.js"
timeout /t 10
docker-compose exec mongo1 sh -c "mongo admin < /scripts/init-usr.js"