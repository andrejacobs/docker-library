FROM golang:1.21 as builder

WORKDIR /usr/src

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
# COPY go.mod go.sum ./
# RUN go mod download && go mod verify
RUN go version
