#!/usr/bin/env bash
VSTS_COMMAND="vso[build.updatebuildnumber]"
DATE=$(date -u +"%Y-%m-%d.T%H-%M-%SZ")

BRANCH_NAME=${BUILD_SOURCEBRANCHNAME}

if [ "${BUILD_REASON}" = "PullRequest" ] ; then
  BRANCH_NAME=PR-${SYSTEM_PULLREQUEST_PULLREQUESTNUMBER}
fi

echo "##${VSTS_COMMAND} ${BRANCH_NAME} ${DATE}"
