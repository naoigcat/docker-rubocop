FROM ruby:2.1.10-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN gem install rainbow -v 3.0.0 && \
    gem install parallel -v 1.13.0 && \
    gem install rubocop -v 0.52.1 && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
