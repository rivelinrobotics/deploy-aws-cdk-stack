#!/bin/sh -l

STACK_ID=${1}
PARAMETER_STRING=${2}
APP_FILE=${3}

CFN_PARAMETERS=${PARAMETER_STRING}
OUTPUT_FILE=.cdk-outputs.json
CDK_PROJECT=/github/workspace

cd ${CDK_PROJECT}

for PARAMETER in ${PARAMETER_STRING}; do
    CFN_PARAMETERS=$(echo ${CFN_PARAMETERS} | sed "s/${PARAMETER}/--parameters ${PARAMETER}/g")
done

FULL_STACK_ID=$(cdk list | grep ${STACK_ID})

cdk deploy \
    --require-approval never \
    --outputs-file ${OUTPUT_FILE} \
    --exclusively \
    ${FULL_STACK_ID} \
    ${CFN_PARAMETERS}

chmod a+rw -R cdk.out
chmod a+rw -R ${OUTPUT_FILE}
echo "stack-output=$(cat ${OUTPUT_FILE} | jq -c --arg ID ${FULL_STACK_ID} '.[$ID]')" >> $GITHUB_OUTPUT
