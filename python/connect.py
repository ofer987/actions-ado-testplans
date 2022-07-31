from azure.devops.connection import Connection
from msrest.authentication import BasicAuthentication
import pprint
import logging
import os
import sys
import traceback
from io import TextIOWrapper
from typing import Mapping, Any, Optional


# GitHub Actions environment file variable names
# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#environment-files
ENV_FILE_VAR_NAME = 'GITHUB_ENV'
PATH_FILE_VAR_NAME = 'GITHUB_PATH'
JOB_SUMMARY_FILE_VAR_NAME = 'GITHUB_STEP_SUMMARY'
personal_access_token = 'INPUT_ADO_PAT'
organization_url = 'INPUT_ADO_ORG_URL'

# Create a connection to the org
credentials = BasicAuthentication('', personal_access_token)
connection = Connection(base_url=organization_url, creds=credentials)

# Get a client (the "core" client provides access to projects, teams, etc)
core_client = connection.clients.get_core_client()

# Get the first page of projects
get_projects_response = core_client.get_projects()
index = 0
while get_projects_response is not None:
    for project in get_projects_response.value:
        pprint.pprint("[" + str(index) + "] " + project.name)
        index += 1
    if get_projects_response.continuation_token is not None and get_projects_response.continuation_token != "":
        # Get the next page of projects
        get_projects_response = core_client.get_projects(continuation_token=get_projects_response.continuation_token)
    else:
        # All projects have been retrieved
        get_projects_response = None