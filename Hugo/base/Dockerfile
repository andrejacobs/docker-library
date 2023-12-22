# Use official Go image as the base
FROM golang:1.21 as builder

# Install dependencies if needed
RUN apt update
RUN apt install -y git

WORKDIR /usr/src

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
# COPY go.mod go.sum ./
# RUN go mod download && go mod verify
RUN go version
RUN git version
