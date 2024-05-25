THIS_SCRIPT_DIR="$(dirname $0)/Apache-Nifi"
LOG_PREFIX="Apache-Nifi docker-run.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Stopping Docker Container with name forex-trade-summarizer-apache-nfi"

docker stop forex-trade-summarizer-apache-nfi

echo "${LOG_PREFIX} COMPLETED Stopping Docker Container with name forex-trade-summarizer-apache-nfi"