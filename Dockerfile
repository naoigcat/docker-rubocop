FROM ruby:3.1.7-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND=noninteractive
# Ruby 2.7 and 3.0 images are based on Debian Bullseye.  Use the snapshots
# bundled in those images because the live Bullseye security repository has
# expired.
RUN if ruby -e "exit(Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.1') ? 0 : 1)"; then \
    sed -i \
        -e 's|^# deb http://snapshot.debian.org|deb http://snapshot.debian.org|' \
        -e 's|^deb http://deb.debian.org|# deb http://deb.debian.org|' \
        /etc/apt/sources.list; \
    fi && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends \
        gcc \
        libc6-dev \
        make \
    && \
    if ruby -e "exit(Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.0') ? 0 : 1)"; then \
    gem install public_suffix -v 5.1.1 --no-document; \
    gem install json-schema -v 5.2.2 --no-document; \
    fi && \
    if ruby -e "exit(Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.3') ? 0 : 1)"; then \
    gem install parallel -v 1.28.0 --no-document; \
    fi && \
    gem install rubocop -v 1.90.0 --no-document && \
    apt-get remove --auto-remove -y gcc libc6-dev make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
