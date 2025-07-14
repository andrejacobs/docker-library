#/bin/bash
# Example of using the Hugo base docker image

set -eu
set -o pipefail

# Build Hugo base image
pushd . > /dev/null
cd ../base
docker build -t aj-hugo-base .
popd > /dev/null

# Run a new container from the docker image tagged aj-hugo-base
# Remap ./quickstart => /usr/local/quickstart
# Expose the port 1313 from the container to the host
# Run hugo to serve the files from /usr/local/quickstart
docker run --rm \
    -v ${PWD}/quickstart:/usr/local/quickstart \
    -p 1313:1313 \
    -t aj-hugo-base \
    hugo server --bind 0.0.0.0 -s /usr/local/quickstart
