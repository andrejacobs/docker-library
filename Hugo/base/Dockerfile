#------------------------------------------------------------------------------
# BUILDER

# Use official Go image as the base
FROM golang:1.21 AS builder

# Install dependencies if needed
RUN apt update && apt upgrade -y
RUN apt install -y git gcc g++

WORKDIR /usr/src

# Build Hugo from source
RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest

#------------------------------------------------------------------------------
# HUGO CONTAINER

# Debain since it is the same base used by golang image
FROM debian:12

WORKDIR /
COPY --chmod=0755 --from=builder /go/bin/hugo /usr/local/bin/hugo
