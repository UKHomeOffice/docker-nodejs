FROM quay.io/ukhomeofficedigital/nodejs-base:v4.4.7

        # Copy downstream in which should help
        # ensure everyone using this has a similar
        # app structure.
ONBUILD COPY . /app

        # Ensure downstream builds are patched.
ONBUILD RUN yum clean all && \
            yum update -y && \
            yum install -y git && \
            yum clean all && \
            rpm --rebuilddb && \

        # Install node depenencies, make sure unit
        # tests are passing, then prune the dev deps.
            rm -rf node_modules && \
            npm --production=false install --unsafe-perm --no-optional && \
            NODE_ENV=development npm test && \
            npm prune --production && \

        # Make sure only user nobody can access these
        # files, forcing downstream to set it.
            chown -R nodejs:nodejs .

# Default startup args.  Can be overwritten.
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 8080
CMD ["start"]
