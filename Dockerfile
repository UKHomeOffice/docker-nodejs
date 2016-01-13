FROM quay.io/ukhomeofficedigital/docker-centos-base

RUN mkdir -p /opt/nodejs /app

WORKDIR /opt/nodejs

ENV NODE_VERSION v4.2.2
RUN yum install -y git curl && \
    curl https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1
ENV PATH=${PATH}:/opt/nodejs/bin
WORKDIR /app

ONBUILD RUN yum clean all && yum update -y && yum clean all && rpm --rebuilddb
ONBUILD COPY . /app/
ONBUILD RUN rm -rf node_modules && npm install
COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
CMD ["start"]
