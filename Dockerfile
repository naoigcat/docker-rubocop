FROM ruby:2.2.10-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND noninteractive
RUN { \
        . /etc/os-release ; \
        VERSION_NAME=$(echo $VERSION | sed -e 's/^.*(\|)$//g') ; \
        echo "deb http://archive.debian.org/debian/ $VERSION_NAME main" ; \
    } > /etc/apt/sources.list && \
    apt-get update --allow-unauthenticated && \
    apt-get install --allow-unauthenticated -y \
        gcc \
        make \
    && \
    gem install parallel -v 1.19.2 && \
    gem install racc -v 1.5.2 && \
    gem install rainbow -v 3.0.0 && \
    gem install stringio -v 0.0.2 && \
    gem install psych -v 3.1.0 && \
    gem install rubocop -v 0.67.2 && \
    apt-get remove --auto-remove -y gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
