FROM ruby:3.3.10-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        libc6-dev \
        make \
    && \
    if ruby -e "exit(Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.0') ? 0 : 1)"; then \
    gem install public_suffix -v 5.1.1 --no-document; \
    gem install json-schema -v 5.2.2 --no-document; \
    fi && \
    gem install rubocop -v 1.85.0 --no-document && \
    apt-get remove --auto-remove -y gcc libc6-dev make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
