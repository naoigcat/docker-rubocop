FROM ruby:2.0.0-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN gem install parallel -v 1.13.0 && \
    gem install rubocop -v 0.50.0 && \
    mkdir -p /app
WORKDIR /app
ENTRYPOINT ["rubocop"]
