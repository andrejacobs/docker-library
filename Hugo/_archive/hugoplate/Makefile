# Build the docker image
.PHONY: build
build:
	docker build -t hugoplate .

# Run the container and copy the site files to the host ./site
.PHONY: init
init: build
	if [ -d "./site" ]; then echo "./site exists!"; exit 1; fi
	docker run --rm -it -v ./site:/tmp/init hugoplate "/usr/src/hugoplate/init.sh"

# Run the container and serve the website for development
.PHONY: dev
dev:
	docker run --rm -it -p 1313:1313 -v ./site:/usr/src/hugoplate hugoplate

# Run the container and let hugo build the static files ready to be published
.PHONY: static
static:
	docker run --rm -it -v ./site:/usr/src/hugoplate -v ./public:/usr/src/hugoplate/public hugoplate "/usr/src/hugoplate/static.sh"

# Shell into the built image for debugging
.PHONY: attach
attach:
	docker run --rm -it --entrypoint bash hugoplate

# Build and export the docker image
.PHONY: export-image
export-image: build
	mkdir -p ./exports
	docker save hugoplate:latest | gzip > ./exports/hugoplate_latest.tar.gz
# Example of importing the image: docker load -i ./exports/hugoplate_latest.tar.gz
