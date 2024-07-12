#!/bin/sh -l

STACK_GLOB=${1}
ADD_STACK_SUFFIX=${2}
APP_FILE=${3}

CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

if [ ${INPUT_EPHEMERAL} == "true" ]; then
    STACK_IDS=$(cdk list | grep ${STACK_GLOB})
    cdk destroy --force --exclusively ${STACK_IDS}
else
    echo Skipping Stack teardown 
fi
