THIS_SCRIPT_DIR="$(dirname $0)/Apache-Nifi"
LOG_PREFIX="Apache-Nifi docker-build.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Creating Docker Image with name forex-trade-summarizer-apache-nfi"

docker build --no-cache -t forex-trade-summarizer-apache-nfi -f "${THIS_SCRIPT_DIR}"/Dockerfile "${THIS_SCRIPT_DIR}"

echo "${LOG_PREFIX} COMPLETED Creating Docker Image with name forex-trade-summarizer-apache-nfi"