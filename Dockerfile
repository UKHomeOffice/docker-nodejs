FROM quay.io/ukhomeofficedigital/docker-centos-base

RUN mkdir -p /workdir/node /workdir/sassc /workdir/libsass /app

WORKDIR /workdir/node
RUN yum install -y curl && \
    yum -y groupinstall "Development Tools" && \
    curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1 && \
    ./configure && \
    make install && \
    yum clean all && \
    rm -rf /workdir/node

RUN rm -rf /workdir
WORKDIR /app

ONBUILD COPY . /app/
ONBUILD RUN rm -rf node_modules && npm install
ENTRYPOINT ["npm"]
CMD ["start"]
