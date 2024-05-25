THIS_SCRIPT_DIR="$(dirname $0)/Apache-Nifi"
LOG_PREFIX="Apache-Nifi docker-run.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Creating Docker Container with name forex-trade-summarizer-apache-nfi"

docker rm create nifi-database-repository || true
docker volume create nifi-database-repository || true
docker run --name forex-trade-summarizer-apache-nfi -v nifi-database-repository:/opt/nifi/database_repository -d -p 9080:8080 forex-trade-summarizer-apache-nfi forex-trade-summarizer-apache-nfi

echo "${LOG_PREFIX} COMPLETED Creating Docker Container with name forex-trade-summarizer-apache-nfi"