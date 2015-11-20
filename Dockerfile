FROM quay.io/ukhomeofficedigital/docker-centos-base

RUN mkdir -p /opt/nodejs /app

WORKDIR /opt/nodejs

ENV NODE_VERSION v4.2.2
RUN yum install -y git curl && \
    curl https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1
ENV PATH=${PATH}:/opt/nodejs/bin
WORKDIR /app

ONBUILD RUN yum update -y && yum clean
