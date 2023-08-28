FROM ruby:2.3.8-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
ENV DEBIAN_FRONTEND noninteractive
RUN { \
        . /etc/os-release ; \
        VERSION_NAME=$(echo $VERSION | sed -e 's/^.*(\|)$//g') ; \
        echo "deb http://archive.debian.org/debian/ $VERSION_NAME main" ; \
    } > /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
        gcc \
        make \
    && \
    gem install parallel -v 1.19.2 && \
    gem install racc -v 1.5.2 && \
    gem install rexml -v 3.2.5 && \
    gem install rubocop -v 0.81.0 && \
    apt-get remove --auto-remove -y gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
