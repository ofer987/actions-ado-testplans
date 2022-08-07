ADO_RUN_NUM_STRING="$( grep 'results as Test Run' output.txt | awk -F'[()]' '{print $2}')";
ADO_RUN_NUM="$(echo $ADO_RUN_NUM_STRING | tr -dc '0-9' | sed 's/%//g')";
echo $ADO_RUN_NUM;