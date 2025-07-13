IMAGE_TAG := docker-test-1
LOCAL_DIR := ./src
CONTAINER_DIR := /tmp
VOLUME_MAPS := -v $(LOCAL_DIR):$(CONTAINER_DIR)

#------------------------------------------------------------------------------
# Build the docker image
.PHONY: build
build:
	docker build -t $(IMAGE_TAG) .

#------------------------------------------------------------------------------
# Run the container and map local files for development
.PHONY: dev
dev:
	docker run --rm -it $(VOLUME_MAPS) $(IMAGE_TAG)

#------------------------------------------------------------------------------
# Run the container
.PHONY: run
run:
	docker run --rm -it $(IMAGE_TAG)

#------------------------------------------------------------------------------
# Shell into the built image for debugging
.PHONY: attach
attach:
	docker run --rm -it --entrypoint /bin/sh $(IMAGE_TAG)

#------------------------------------------------------------------------------
# Build and export the docker image
.PHONY: export-image
export-image: build
	mkdir -p ./exports
	docker save $(IMAGE_TAG):latest | gzip > ./exports/$(IMAGE_TAG)_latest.tar.gz
# Example of importing the image: docker load -i ./exports/$(IMAGE_TAG)_latest.tar.gz
