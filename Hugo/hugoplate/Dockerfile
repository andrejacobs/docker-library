
#------------------------------------------------------------------------------
# hugoplate

# Use official Node image as the base
ARG NODE_VERSION=latest

FROM node:${NODE_VERSION} AS builder-hugoplate

ARG GO_VERSION=1.22.2
ARG HUGO_VERSION=latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git

WORKDIR /tmp

# Install Go
RUN set -eu && \
    # Determine architecture
    case $(uname -m) in \
        aarch64) export ARCH=arm64 ;; \
        *) export ARCH=amd64 ;; \
    esac && \
    # Download and install Go
    wget -O go${GO_VERSION}.linux-${ARCH}.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-${ARCH}.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-${ARCH}.tar.gz && \
    rm go${GO_VERSION}.linux-${ARCH}.tar.gz

# Export Go path
ENV PATH=$PATH:/usr/local/go/bin

# Install Hugo
RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@${HUGO_VERSION}
RUN cp /root/go/bin/hugo /usr/local/bin/hugo

# Clone hugoplate
WORKDIR /usr/src
RUN git clone https://github.com/zeon-studio/hugoplate.git

# Setup hugoplate and install dependancies
WORKDIR /usr/src/hugoplate
RUN npm run project-setup
RUN npm install

EXPOSE 1313

# ENTRYPOINT [ "hugo", "server", "--bind", "0.0.0.0" ]
CMD [ "hugo", "server", "--bind", "0.0.0.0" ]
