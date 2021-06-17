FROM golang:1.16.5-alpine

RUN apk --no-cache add curl

ARG CC_VERSION="v15"
RUN \
echo ">> Downloading cross-compilers..." && \
curl -Lfs "https://github.com/just-containers/musl-cross-make/releases/download/${CC_VERSION}/gcc-9.2.0-arm-linux-musleabihf.tar.xz" | tar -xJ --directory / && \
curl -Lfs "https://github.com/just-containers/musl-cross-make/releases/download/${CC_VERSION}/gcc-9.2.0-aarch64-linux-musl.tar.xz" | tar -xJ --directory /

RUN \
echo ">> Downloading required apk's..." && \
apk --no-cache add gcc musl-dev curl
