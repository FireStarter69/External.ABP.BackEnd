#!/bin/bash

if [[ ! -d certs ]]
then
    mkdir certs
    cd certs/
    if [[ ! -f localhost.pfx ]]
    then
        dotnet dev-certs https -v -ep localhost.pfx -p c8dfe4de-d88f-4c33-b7c5-3bac2214413e -t
    fi
    cd ../
fi

docker-compose up -d
