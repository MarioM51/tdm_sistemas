#!/bin/bash
set -e

if ! [ -d ./dist/ ]; then
  echo "dist/ no existe";
  exit 1;
fi

name=${name:-null}

#optioal, points that the backup to create is because
#its goint to run a restore
pre=${pre:-null}

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

echo "-----------------------------------"
echo "Creating database backup ..."
echo "-----------------------------------"

pg_dump --verbose \
  --port 5432 \
  --username postgres \
  --host 127.0.0.1 \
  --file ./dist/data.sql \
  carro_de_madera_db

echo "-----------------------------------"
echo "Created database backup: ./dist/data.sql"
echo "-----------------------------------"


echo "-----------------------------------"
echo "Creating backup.zip ..."
echo "-----------------------------------"

DATE="$(date +"%Y-%m-%d_%H-%M-%S")"
BACKUP_NAME=$DATE"_"$name.backup

ZIP_NAME=$BACKUP_NAME
if [ "$pre" != "null" ]; then
  ZIP_NAME=$name.$DATE
fi

tar -v -czf ./backups/$ZIP_NAME.tar.gz dist/
rm -vf ./dist/data.sql

echo "-----------------------------------"
echo "backup Created successfully: $ZIP_NAME"
echo "-----------------------------------"