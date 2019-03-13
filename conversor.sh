#!/bin/bash

echo Creando JSON
cd CsvToJson
node convertir.js

read -rsp $'Press enter to continue...\n'