#!/bin/sh -l

STACK_ID=${1}
ADD_STACK_SUFFIX=${2}
APP_FILE=${3}
FULL_STACK_ID=${STACK_ID}
UNSCOPED_APP=${APP_FILE}.tmp
CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

if [ ${INPUT_EPHEMERAL} == "true" ]; then

    if [ ${ADD_STACK_SUFFIX} == "true" ]; then
        git config --global --add safe.directory ${CDK_PROJECT}
        FULL_STACK_ID=${STACK_ID}$(git rev-parse --short HEAD)
        mv ${APP_FILE} ${UNSCOPED_APP}
        sed "s/\"${STACK_ID}\"/\"${FULL_STACK_ID}\"/g" ${UNSCOPED_APP} > ${APP_FILE}
    fi

    cdk destroy --force --exclusively ${FULL_STACK_ID}

    if [ ${ADD_STACK_SUFFIX} == "true" ]; then
        rm ${APP_FILE}
        mv ${UNSCOPED_APP} ${APP_FILE}
    fi

else

    echo Skipping Stack teardown 

fi