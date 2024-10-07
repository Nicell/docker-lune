ARG LUNE_VERSION=0.8.9
ARG BIN_IMAGE=nicell/lune:bin-${LUNE_VERSION}

FROM ${BIN_IMAGE} AS bin

FROM debian:stable-slim

ARG LUNE_VERSION
ENV LUNE_VERSION=${LUNE_VERSION}

COPY --from=bin lune /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["repl"]
