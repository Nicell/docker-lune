ARG LUNE_VERSION=0.8.6
ARG BIN_IMAGE=nicell/lune:bin-${LUNE_VERSION}

FROM ${BIN_IMAGE} AS bin

FROM gcr.io/distroless/cc

ARG LUNE_VERSION
ENV LUNE_VERSION=${LUNE_VERSION}

COPY --from=bin lune /bin/

ENTRYPOINT ["lune"]

CMD ["repl"]
