ADO_RUN_NUM=1
ADO_RUN_URL="$(echo "https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training/_testManagement/runs?_a=runCharts&runId=$ADO_RUN_NUM")"
echo $ADO_RUN_URL