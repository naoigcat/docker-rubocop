FROM ruby:3.4.7-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND=noninteractive
# Copy local CA certificates for development environments with SSL proxies
COPY ca-certs/ /usr/local/share/ca-certificates/
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
