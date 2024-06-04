FROM node:20-alpine3.17

RUN npm install -g aws-cdk@2.144.0
RUN apk add --no-cache \
    py3-pip \
    git \
    jq
RUN pip3 install \
    aws-cdk.aws-cognito-identitypool-alpha==2.144.0a0 \
    aws-cdk-lib==2.144.0 \
    constructs==10.3.0 \
    cdk-nag==2.28.130

COPY ./deploy.sh /deploy.sh
COPY ./destroy.sh /destroy.sh