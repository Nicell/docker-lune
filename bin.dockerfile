ARG LUNE_VERSION=0.8.7

FROM buildpack-deps:curl AS download

RUN apt-get update && apt-get install -y unzip

ARG LUNE_VERSION
ARG TARGETARCH

RUN curl -fsSL https://github.com/lune-org/lune/releases/download/v${LUNE_VERSION}/lune-${LUNE_VERSION}-linux-$(echo $TARGETARCH | sed -e 's/arm64/aarch64/' -e 's/amd64/x86_64/').zip \
  --output lune.zip \
  && unzip lune.zip

FROM scratch

ARG LUNE_VERSION
ENV LUNE_VERSION=${LUNE_VERSION}

COPY --from=download /lune /lune
