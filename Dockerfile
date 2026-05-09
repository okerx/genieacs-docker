FROM node:20-bookworm-slim

ARG GENIEACS_VERSION=1.2.16

ENV NODE_ENV=production \
    NODE_OPTIONS=--enable-source-maps \
    GENIEACS_EXT_DIR=/opt/genieacs/ext

RUN set -eux; \
    groupadd --system genieacs; \
    useradd --system --no-create-home --gid genieacs genieacs; \
    mkdir -p /opt/genieacs/ext /var/log/genieacs; \
    chown -R genieacs:genieacs /opt/genieacs /var/log/genieacs; \
    npm install --global "genieacs@${GENIEACS_VERSION}"; \
    npm cache clean --force

USER genieacs

EXPOSE 3000 7547 7557 7567

CMD ["genieacs-ui"]
