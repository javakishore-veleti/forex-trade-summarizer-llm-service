THIS_SCRIPT_DIR="$(dirname $0)/Apache-Nifi"
LOG_PREFIX="Apache-Nifi docker-remove.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Removing Docker Container with name forex-trade-summarizer-apache-nfi"

docker stop forex-trade-summarizer-apache-nfi || true
docker rm forex-trade-summarizer-apache-nfi || true

# docker volume rm nifi-database-repository || true


echo "${LOG_PREFIX} COMPLETED Removing Docker Container with name forex-trade-summarizer-apache-nfi"