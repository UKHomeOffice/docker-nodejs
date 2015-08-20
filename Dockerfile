FROM quay.io/ukhomeofficedigital/docker-centos-base

RUN yum install -y curl && \
    yum -y groupinstall "Development Tools" && \
    mkdir ~/node-latest-install && \
    cd ~/node-latest-install && \
    curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1 && \
    ./configure && \
    make install && \
    yum clean all && \
    rm -rf ~/node-latest-install && \
    mkdir /app

WORKDIR /app

ON BUILD COPY . /app/
ON BUILD RUN npm install
ENTRYPOINT [ "npm"]
CMD ["start"]
