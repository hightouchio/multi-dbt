#!/usr/bin/env bash
set -euo pipefail

DBT_VERSIONS=$(echo $VERSIONS | tr "," "\n")
for VERSION in $DBT_VERSIONS
do
    FOLDER="dbt-$VERSION"
    echo "Creating virtual environment folder: $FOLDER"
    mkdir ./$FOLDER

    echo "Install dbt==$VERSION to folder $FOLDER"
    # TODO: Change from dbt-core to dbt for production run
    python3 -m venv $FOLDER
    source $FOLDER/bin/activate
    pip3 install dbt-core==$VERSION

done
