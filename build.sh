#!/usr/bin/env bash
set -euo pipefail

VERSIONS="${VERSIONS:-0.20}"

IN_DOCKER=false
if [ -f /.dockerenv ]; then
    IN_DOCKER=true
fi

DBT_VERSIONS=$(echo $VERSIONS | tr "," "\n")
for VERSION in $DBT_VERSIONS

do
    FOLDER="dbt-$VERSION"
    echo "Creating virtual environment folder: $FOLDER"
    mkdir ./$FOLDER

    echo "Install dbt==$VERSION to folder $FOLDER"
    python3 -m venv --copies $FOLDER
    source $FOLDER/bin/activate
    pip3 install dbt==$VERSION

done
