#!/bin/bash
set -e

# Declare variables
SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

BACKEND_SCRIPT_BUILDER="$SCRIPT_PATH/../api/build_backend_script.sh"
FRONTEND_SCRIPT_BUILDER="$SCRIPT_PATH/../svelte/build_frontend.sh"
DISTRIBUTION_DIR_PATH="$SCRIPT_PATH/dist"
GO_DEPENDENCIES_LINUX="$SCRIPT_PATH/pkg_lin"

env=${env:-null}

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
        # echo $1 $2 // Optional to see the parameter:value result
   fi
  shift
done

# pre-conditions
if [ "$env" == "null" ]; then
  echo "bad input: --env required, [local, test]"
  exit 1
fi

#repited in build_backend_script.sh
if ! [[ $env == "test" || $env == "local" ]]; then
  echo "--env: must be test or local, but it was $env"
  exit 1
fi


# show variables
echo "=== VARIABLES ==="
echo "FOLDERS"
echo "  BACKEND_PATH: $BACKEND_PATH"
echo "  DISTRIBUTION_DIR_PATH: $DISTRIBUTION_DIR_PATH"
echo "  GO_DEPENDENCIES_LINUX: $GO_DEPENDENCIES_LINUX"

echo "COMMAND VARIABLES"
echo "  env: $env"

echo "CLEANING DIST DIRECTORY ..."
rm -r -f -v ./dist/
mkdir -v ./dist/

cd "$SCRIPT_PATH/../api/"
bash $BACKEND_SCRIPT_BUILDER --env $env --dist_directory $DISTRIBUTION_DIR_PATH --exe_filename server_app.exe
cd $SCRIPT_PATH

cd "$SCRIPT_PATH/../svelte/"
bash $FRONTEND_SCRIPT_BUILDER --output_dir $DISTRIBUTION_DIR_PATH
cd $SCRIPT_PATH

echo "fin"
exit 0;
