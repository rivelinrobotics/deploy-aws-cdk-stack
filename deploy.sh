#!/bin/sh -l

STACK_ID=${1}
ADD_STACK_SUFFIX=${2}
PARAMETER_STRING=${3}
CFN_PARAMETERS=${PARAMETER_STRING}
FULL_STACK_ID=${STACK_ID}
UNSCOPED_APP=app.py.tmp
OUTPUT_FILE=.cdk-outputs.json
CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

if [ ${ADD_STACK_SUFFIX} == "true" ]; then
    git config --global --add safe.directory ${CDK_PROJECT}
    FULL_STACK_ID=${STACK_ID}$(git rev-parse --short HEAD)
    mv app.py ${UNSCOPED_APP}
    sed "s/\"${STACK_ID}\"/\"${FULL_STACK_ID}\"/g" ${UNSCOPED_APP} > app.py
fi

for PARAMETER in ${PARAMETER_STRING}; do
    CFN_PARAMETERS=$(echo ${CFN_PARAMETERS} | sed "s/\"${PARAMETER}\"/--parameters \"${PARAMETER}\"/g")
done

echo CFN_PARAMETERS=${CFN_PARAMETERS}

cdk deploy \
    --require-approval never \
    --outputs-file ${OUTPUT_FILE} \
    ${CFN_PARAMETERS} \
    --exclusively \
    ${FULL_STACK_ID}

chmod a+rw -R cdk.out
chmod a+rw -R ${OUTPUT_FILE}

if [ ${ADD_STACK_SUFFIX} == "true" ]; then
    rm app.py
    mv ${UNSCOPED_APP} app.py
fi

echo "stack-output=$(cat ${OUTPUT_FILE} | jq -c --arg ID ${FULL_STACK_ID} '.[$ID]')" >> $GITHUB_OUTPUT
