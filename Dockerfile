FROM quay.io/ukhomeofficedigital/docker-centos-base

RUN mkdir -p /opt/nodejs
WORKDIR /opt/nodejs

ENV NODE_VERSION v4.2.2
RUN yum install -y git curl && \
    curl https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1

RUN useradd app
USER app

ENV PATH=${PATH}:/opt/nodejs/bin
WORKDIR /home/app

ONBUILD COPY . .
ONBUILD RUN rm -rf node_modules && npm install
COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
CMD ["start"]
