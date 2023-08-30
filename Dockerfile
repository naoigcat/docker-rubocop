FROM ruby:2.4.10-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        gcc \
        make \
    && \
    gem install parallel -v 1.20.1 && \
    gem install racc -v 1.5.2 && \
    gem install rexml -v 3.2.5 && \
    gem install rubocop-ast -v 1.4.1 && \
    gem install rubocop -v 1.9.1 && \
    apt-get remove --auto-remove -y gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
