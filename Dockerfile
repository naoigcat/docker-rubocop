FROM ruby:4.0.1-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        libc6-dev \
        make \
    && \
    if ruby -e "exit(RUBY_VERSION.start_with?('2.7') ? 0 : 1)"; then gem install public_suffix -v 5.1.1 --no-document; fi && \
    gem install rubocop -v 1.84.2 --no-document && \
    apt-get remove --auto-remove -y gcc libc6-dev make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
