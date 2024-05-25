THIS_SCRIPT_DIR="$(dirname $0)"
LOG_PREFIX="docker-run-all.sh"

echo "${LOG_PREFIX} THIS_SCRIPT_DIR=${THIS_SCRIPT_DIR}"
echo "${LOG_PREFIX} STARTED Running Docker Images"

echo "${LOG_PREFIX} STARTED Running Apache-Nifi Docker Containers"
. "${THIS_SCRIPT_DIR}"/Apache-Nifi/docker-run-simple.sh

echo "${LOG_PREFIX} COMPLETED Running Docker Images"
