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

WORKDIR /workdir/sassc
RUN git clone https://github.com/hcatlin/sassc.git /workdir/sassc && \
    git clone https://github.com/hcatlin/libsass.git /workdir/libsass && \
    sed -i '1iexport SASS_LIBSASS_PATH=/workdir/libsass' /workdir/sassc/Makefile && \
    make && \
    make install && \
    rm -rf /workdir

WORKDIR /app

ONBUILD COPY . /app/
ONBUILD RUN npm install
ENTRYPOINT ["npm"]
CMD ["start"]
