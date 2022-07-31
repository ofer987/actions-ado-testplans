#! /usr/bin/env sh

cd /action
# Set ADO ORG URL
python src/runner.py config url --set-to ${INPUT_ADO_ORG_URL}
# Set ADO PAT
python src/runner.py config pat --set-to ${INPUT_ADO_PAT}

# RUN ADO TEST MODULE
python /src/runner.py run test all