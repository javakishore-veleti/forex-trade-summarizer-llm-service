THIS_SCRIPT_DIR="$(dirname $0)"
LOG_PREFIX="docker-stop-all.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Stopping Docker Images"

echo "${LOG_PREFIX} STARTED Running Apache-Nifi Docker Image"
. "${THIS_SCRIPT_DIR}"/Descriptors/Apache-Nifi/docker-run.sh

echo "${LOG_PREFIX} COMPLETED Stopping Docker Images"