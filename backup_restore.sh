#!/bin/bash
set -e

name=${name:-null}

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done


if [ "$name" == "null" ]; then
  echo "bad input: --name required, name of the .zip file with all backup files"
  exit 1
fi

regex='^[-\.a-zA-Z0-9_]{5,}$'
if ! [[ $name =~ $regex ]]; then
  echo "--name bad input, only accepted ^[-\.a-zA-Z0-9_]{5,}$"
  exit 1
fi

if ! [ -f ./backups/$name ]; then
  echo "backup ./backups/$name not exist";
  exit 1;
fi

#bash backup_create.sh --name pre_$name --pre true





echo "-----------------------------------"
echo "Remplazing dist/ folder ..."
echo "-----------------------------------"

echo "remove dist/"
rm -r ./dist/

echo "create dist/ from backup"
tar -vxzf ./backups/$name

echo "-----------------------------------"
echo "finished: Remplazing dist/ folder"
echo "-----------------------------------"






echo "-----------------------------------"
echo "Remplasing database ..."
echo "-----------------------------------"

echo "Deleting database ..."
psql -U postgres -c 'DROP DATABASE IF EXISTS carro_de_madera_db;'
psql -U postgres -c 'CREATE DATABASE carro_de_madera_db;'
echo "Deleting database finished"

echo "Creating database from data.sql of backup "
psql -d carro_de_madera_db -U postgres -f ./dist/data.sql

echo "-----------------------------------"
echo "finished: Remplasing database"
echo "-----------------------------------"

