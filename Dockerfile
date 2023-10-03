FROM node:20-alpine3.17

RUN apk add --no-cache py3-pip
RUN npm install -g aws-cdk@2.96.2
RUN pip3 install \
    aws-cdk-lib==2.93.0 \
    constructs==10.2.70