THIS_SCRIPT_DIR="$(dirname $0)/Apache-Nifi"
LOG_PREFIX="Apache-Nifi docker-run-simple.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Creating Docker Container with name forex-trade-summarizer-apache-nfi"

docker run --name forex-trade-summarizer-apache-nfi  \
  -p 8443:8443 \
  -d \
  -e SINGLE_USER_CREDENTIALS_USERNAME=admin \
  -e SINGLE_USER_CREDENTIALS_PASSWORD=ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB \
  apache/nifi:latest


echo "${LOG_PREFIX} COMPLETED Creating Docker Container with name forex-trade-summarizer-apache-nfi"