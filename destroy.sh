#!/bin/sh -l

STACK_ID=${1}
ADD_STACK_SUFFIX=${2}
FULL_STACK_ID=${STACK_ID}

if [ ${ADD_STACK_SUFFIX} == "true" ]; then
    git config --global --add safe.directory /github/workspace
    FULL_STACK_ID=${STACK_ID}$(git rev-parse --short HEAD)
    mv app.py app.py.tmp
    sed "s/\"${STACK_ID}\"/\"${FULL_STACK_ID}\"/g" app.py.tmp > app.py
fi

cdk destroy \
    --require-approval never \
    --exclusively \
    ${FULL_STACK_ID}

if [ ${ADD_STACK_SUFFIX} == "true" ]; then
    rm app.py
    mv app.py.tmp app.py
fi