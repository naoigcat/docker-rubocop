FROM ruby:3.4.7-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND=noninteractive
# Copy CA certificates from ca-certs directory if it exists (optional, for SSL proxy environments).
# To add custom certificates, create ca-certs directory before building:
#   mkdir -p ca-certs && cp /usr/local/share/ca-certificates/*.crt ca-certs/
# The ca-certs directory is gitignored and created locally as needed.
COPY --chown=root:root ca-cert[s]/ /usr/local/share/ca-certificates/
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        gcc \
        make \
    && \
    update-ca-certificates && \
    gem install rubocop -v 1.81.7 && \
    apt-get remove --auto-remove -y gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
