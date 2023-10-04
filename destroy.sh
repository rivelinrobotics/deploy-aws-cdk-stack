#!/bin/sh -l

STACK_ID=${1}
ADD_STACK_SUFFIX=${2}
FULL_STACK_ID=${STACK_ID}
UNSCOPED_APP=app.py.tmp
CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

if [ ${INPUT_EPHEMERAL} == "true" ]; then

    if [ ${ADD_STACK_SUFFIX} == "true" ]; then
        git config --global --add safe.directory ${CDK_PROJECT}
        FULL_STACK_ID=${STACK_ID}$(git rev-parse --short HEAD)
        mv app.py ${UNSCOPED_APP}
        sed "s/\"${STACK_ID}\"/\"${FULL_STACK_ID}\"/g" ${UNSCOPED_APP} > app.py
    fi

    cdk destroy --force --exclusively ${FULL_STACK_ID}

    if [ ${ADD_STACK_SUFFIX} == "true" ]; then
        rm app.py
        mv ${UNSCOPED_APP} app.py
    fi

else

    echo Skipping Stack teardown 

fi