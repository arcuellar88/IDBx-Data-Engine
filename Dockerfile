# mxabierto buda-crawler
# https://github.com/mxabierto/buda
# Build:
#   docker build -t iadb/edx-import .
# Usage:
#   docker run \
#   --env AWS_ACCESS_KEY_ID=... \
#   --env AWS_SECRET_ACCESS_KEY=... \
#   --env KEY_PASSPHRASE=... \
#   --env STORAGE_DB=edx \
#   --link STORAGE_ID:storage \
#   iadb/edx-import

FROM debian:jessie

MAINTAINER bcessa <ben@pixative.com>

ADD . /edx-import

WORKDIR /edx-import

RUN \
  # Basic deps
  apt-get update && \
  apt-get install -y \
    curl \
    python-pip \
    unzip \
    wget && \
  # AWS CLI
  pip install awscli && \
  # Local module
  npm install -g . && \
  chmod 775 /edx-import/run.sh

ENTRYPOINT ["/edx-import/run.sh"]
