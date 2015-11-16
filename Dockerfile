FROM quay.io/ukhomeofficedigital/docker-centos-base

ENV NODE_VERSION v4.2.2

RUN mkdir -p /opt/nodejs /app

WORKDIR /opt/nodejs
RUN yum install -y curl && \
    curl https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1
ENV PATH=${PATH}:/opt/nodejs/bin
WORKDIR /app

ONBUILD COPY . /app/
ONBUILD RUN rm -rf node_modules && npm install
COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
CMD ["start"]
