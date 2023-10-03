FROM node:20-alpine3.17

RUN npm install -g aws-cdk@2.99.1
RUN apk add --no-cache \
    py3-pip \
    git
RUN pip3 install \
    aws-cdk-lib==2.93.0 \
    constructs==10.2.70

COPY ./deploy.sh /deploy.sh

WORKDIR /github/workspace
ENTRYPOINT [ "/deploy.sh" ]