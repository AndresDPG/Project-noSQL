# Project-noSQL
Project noSQL

## Arquitectura implementada en la base de datos:
  * 1 servidor mongos
  * 1 servidor de configuración con dos replica set
  * 3 servidores sharding cada uno con su replica set
  
## Instrucciones:

### 1. Para iniciar todos los contenedores ejecutar el siguiente comando:

```
docker-compose up -d
```

### 2. Ejecutar el siguiente archivo de configuración:

```
config.sh
```

### 3. Ejecutar el siguiente archivo para convertir el CSV a JSON

```
conversor.sh
```

### 4. Ejecutar el siguiente archivo para copiar la base de datos a docker:

```
bd.sh
```

### 5. En una terminal ejecutar los siguientes comandos para copiar la base de datos al cliente mongos:

```
docker exec -it projectnosql_mongos1_1 /bin/bash

mongoimport --db cancer --collection articles --drop --file /tmp/cancer.json --jsonArray

exit

```

### 6. Comprobación y consultas:

```
docker exec -it projectnosql_mongos1_1 mongo

use cancer

db.articles.count()

Resultado = 2500 registros

db.articles.find({"Title" : "Suicide among cancer patients"}).pretty()

Resultado = 

{
  "_id" : ObjectId("5c89196127de55cefa6c5809"),
    
    "Authors" : "Zaorsky N.G., Zhang Y., Tuanquin L., Bluethmann S.M., Park H.S., Chinchilli V.M.",
    
    "Author(s) ID" : "54783829500;56454491700;35367451600;55243830700;35293198600;35944661100;",
    
    "Title" : "Suicide among cancer patients",
    
    "Year" : 2019,
    
    "Source title" : "Nature Communications",
    
    "Link" : "https://www.scopus.com/inward/record.uri?eid=2-s2.0-85060018054&doi=10.1038%2fs41467-018-08170-1&partnerID=40&md5=b3e13cc45368e238ce6285ba65484f06",
    
    "Abstract" : "....",
    
    "References" : "....."
}

db.articles.count({"Year" : 2019})

Resultado = 2000 registros

db.articles.count({"Year" : 2018})

Resultado = 0 registros

db.articles.count({"Year" : 2017})

Resultado = 500 registros
```
