#!/bin/sh -l

STACK_ID=${1}
ADD_STACK_SUFFIX=${2}
APP_FILE=${3}

CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

if [ ${INPUT_EPHEMERAL} == "true" ]; then
    FULL_STACK_ID=$(cdk list | grep ${STACK_ID})
    cdk destroy --force --exclusively ${FULL_STACK_ID}
else
    echo Skipping Stack teardown 
fi