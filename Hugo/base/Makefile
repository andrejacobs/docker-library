# Docker image
IMAGE_TAG := hugo-site-generator
LOCAL_PORT := 1313
CONTAINER_PORT := 1313
# Directories and files
CONTAINER_HOME_DIR := /home/aj
LOCAL_SITE_DIR := ./site
CONTAINER_SITE_DIR := $(CONTAINER_HOME_DIR)/site
LOCAL_CONTENT_DIR := ./content
CONTAINER_CONTENT_DIR := $(CONTAINER_SITE_DIR)/content
LOCAL_PUBLIC_DIR := ./public
CONTAINER_PUBLIC_DIR := $(CONTAINER_SITE_DIR)/public

# Mapping local dirs to container dirs (while developing)
VOLUME_MAPS := -v $(LOCAL_SITE_DIR):$(CONTAINER_SITE_DIR) \
	-v $(LOCAL_CONTENT_DIR):$(CONTAINER_CONTENT_DIR) \
	-v $(LOCAL_PUBLIC_DIR):$(CONTAINER_PUBLIC_DIR)

# Scripts to run in the container
CONTAINER_SCRIPT_DIR := $(CONTAINER_HOME_DIR)
CONTAINER_SCRIPT_DEV := $(CONTAINER_SCRIPT_DIR)/dev.sh
CONTAINER_SCRIPT_PROD := $(CONTAINER_SCRIPT_DIR)/prod.sh
CONTAINER_SCRIPT_COPY_SITE := $(CONTAINER_SCRIPT_DIR)/copy-to-host.sh

#------------------------------------------------------------------------------
# Build the docker image
.PHONY: build
build:
	docker build -t $(IMAGE_TAG) .

# Initial copy of the site files to the host
.PHONY: init-host
init-host:
	@if [ ! -d $(LOCAL_SITE_DIR) ]; then \
		echo "Copying container site to $(LOCAL_SITE_DIR)"; \
		mkdir -p $(LOCAL_SITE_DIR); \
		docker run --rm -it -v $(LOCAL_SITE_DIR):/var/tmp/hugo/site $(IMAGE_TAG) $(CONTAINER_SCRIPT_COPY_SITE); \
		if [ ! -d $(LOCAL_CONTENT_DIR) ]; then \
			echo "Copying content to $(LOCAL_CONTENT_DIR)"; \
			mkdir -p $(LOCAL_CONTENT_DIR); \
			cp -R $(LOCAL_SITE_DIR)/content/ $(LOCAL_CONTENT_DIR)/; \
		fi; \
	fi;

#------------------------------------------------------------------------------
# Run the container with the hugo server and map local files for development
.PHONY: dev
dev: init-host
	docker run --rm -it -p $(LOCAL_PORT):$(CONTAINER_PORT) $(VOLUME_MAPS) $(IMAGE_TAG) $(CONTAINER_SCRIPT_DEV)

#------------------------------------------------------------------------------
# Run the container and let hugo generate the final site
.PHONY: public
public:
	rm -rf $(LOCAL_PUBLIC_DIR)
	docker run --rm -it $(VOLUME_MAPS) $(IMAGE_TAG) $(CONTAINER_SCRIPT_PROD)

#------------------------------------------------------------------------------
# Shell into the built image for debugging
.PHONY: attach
attach:
	docker run --rm -it -p $(LOCAL_PORT):$(CONTAINER_PORT) --entrypoint /bin/bash $(IMAGE_TAG)

#------------------------------------------------------------------------------
# Build and export the docker image
.PHONY: export-image
export-image: build
	mkdir -p ./exports
	docker save $(IMAGE_TAG):latest | gzip > ./exports/$(IMAGE_TAG)_latest.tar.gz
# Example of importing the image: docker load -i ./exports/$(IMAGE_TAG)_latest.tar.gz
