#!/bin/bash

winpty docker-compose exec config01 sh -c "mongo --port 27017 < ./scripts/configserver.js"
winpty docker-compose exec shard01a sh -c "mongo --port 27018 < ./scripts/shard01.js"
winpty docker-compose exec shard02a sh -c "mongo --port 27019 < ./scripts/shard02.js"
winpty docker-compose exec shard03a sh -c "mongo --port 27020 < ./scripts/shard03.js"
sleep 20
winpty docker-compose exec mongos1 sh -c "mongo < ./scripts/mongos1.js"

read -rsp $'Press enter to continue...\n'