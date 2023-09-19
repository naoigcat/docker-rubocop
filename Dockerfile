FROM ruby:2.7.8-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        gcc \
        make \
    && \
    gem install rubocop -v 1.42.0 && \
    apt-get remove --auto-remove -y gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
