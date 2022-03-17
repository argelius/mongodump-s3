FROM alpine:3.15

RUN apk add --update-cache \
    bash mongodb-tools aws-cli \
  && rm -rf /var/cache/apk/*

ADD entrypoint.sh /app/entrypoint.sh

WORKDIR /app

ENTRYPOINT ["./entrypoint.sh"]
