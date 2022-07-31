"""
TEST samples
"""
import datetime
import logging

from samples import resource
from utils import emit
import os

# Get environment variables
INPUT_PLAN_ID = os.getenv('INPUT_PLAN_ID')
INPUT_PROJECT_ID = os.environ.get('INPUT_PROJECT_ID')
INPUT_SUITE_ID = os.environ.get('INPUT_SUITE_ID')
FEATURE_WISE_TEST_SUITES = os.environ.get('INPUT_FEATURE_WISE_TEST_SUITES')
FEATURE_PATH = os.environ.get('INPUT_FEATURE_PATH')

logger = logging.getLogger(__name__)


def get_project_names(context):
    core_client = context.connection.clients.get_core_client()
    return (project.name for project in core_client.get_projects())


@resource("test_plans")
def get_plans(context):
    test_client = context.connection.clients.get_test_client()
    for project in get_project_names(context):
        try:
            for plan in test_client.get_plans(project):
                emit("Test Plan {}: {} ({})".format(plan.id, plan.name, plan.area.name))
                if INPUT_PLAN_ID == plan.id:
                    print('Plan ID entered by user is valid')
        except Exception as e:
            emit("Project '{}' raised error: {}".format(project, e))


@resource("test_suites")
def get_test_suites_for_plan(context):
    test_client = context.connection.clients.get_test_client()
    for project in get_project_names(context):
        try:
            for plan in test_client.get_plans(project):
                for suite in test_client.get_test_suites_for_plan(project, plan.id):
                    emit(
                        "Test Suite {}: {} ({}.{})".format(
                            suite.id, suite.name, plan.id, plan.name
                        )
                    )
                    if INPUT_SUITE_ID != '':
                        if INPUT_SUITE_ID == suite.id:
                            print('Suite ID entered by user is valid')
        except Exception as e:
            emit("Project '{}' raised error: {}".format(project, e))


# @resource("test_runs")
# def get_test_runs(context):
#     test_client = context.connection.clients.get_test_client()
#     for project in get_project_names(context):
#         try:
#             for run in test_client.get_test_runs(project, top=16):
#                 emit(
#                     "Test Run {}: {} => {} ({})".format(
#                         run.id, run.name, run.state, project
#                     )
#                 )
#         except Exception as e:
#             emit("Project '{}' raised error: {}".format(project, e))


# @resource("test_results")
# def get_test_results(context):
#     test_client = context.connection.clients.get_test_client()
#     for project in get_project_names(context):
#         try:
#             for run in test_client.get_test_runs(project, top=10):
#                 # Limiting Test Results is not something one shall do!
#                 for res in test_client.get_test_results(project, run.id, top=3):
#                     tc = res.test_case
#                     tester = res.run_by.display_name
#                     emit(
#                         "Test Result {}: {} => {} by {} ({})".format(
#                             run.id, tc.name, res.outcome, tester, project
#                         )
#                     )
#         except Exception as e:
#             emit("Project '{}' raised error: {}".format(project, e))
