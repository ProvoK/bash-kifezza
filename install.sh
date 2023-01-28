#!/bin/bash

set -euf pipefail

VERSION="dev"
INSTALLATION_PATH="/opt/bask"
REPO_NAME="bash-kifezza"

rm -rf /opt/bask

curl -L -o bask.tar.gz https://github.com/ProvoK/${REPO_NAME}/archive/refs/tags/${VERSION}.tar.gz 2>/dev/null
mkdir -p /tmp/bask
mkdir -p /opt/bask
tar -xvf bask.tar.gz --directory /tmp/bask
mv /tmp/bask/${REPO_NAME}-${VERSION}/commands ${INSTALLATION_PATH}
mv /tmp/bask/${REPO_NAME}-${VERSION}/base ${INSTALLATION_PATH}
rm -rf bask.tar.gz /tmp/bask

USAGE=$(cat <<- EOF
Bask correctly installed to ${INSTALLATION_PATH}

Please add this line at the end of your bashrc/zhsrc config file

export PATH=${INSTALLATION_PATH}/commands:${INSTALLATION_PATH}/base:\${PATH}

Bye!

EOF
)

echo "${USAGE}"
exit 0
