# Minimal docker test

This contains a minimal Dockerfile to build an image that copies a single file from `src` to the image.
It also contains a minimal Makefile I use to build the image and run a container.

-   Build container image: `make build`
-   Run container: `make run`
-   Run container while being able to develop on local files: `make dev`
-   Run container and attach shell to it: `make attach`
-   Build and export image to a .tar.gz: `make export-image`
-   Import the .tar.gz image: `docker load -i ./exports/${IMAGE_TAG}_latest.tar.gz`

## Experiments

-   Is it possible to make changes to the local files (development) while running the container as is? (usefull while live reloading webservices)

    ```
    $ make build
    $ make run
    Hello World

    # Edit src/me.txt

    $ make dev
    Hello Andre

    # The image's files should remain unchanged
    $ make run
    ```

-   Backup and restore

    ```
    # Build latest image and export backup file
    $ make export-image

    $ docker image list
    REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
    docker-test-1   latest    e8b252c69aee   2 minutes ago   8.75MB

    # Delete the image
    $ docker image remove docker-test-1:latest
    Untagged: docker-test-1:latest
    Deleted: sha256:e8b252c69aee2390e7d75cbf578069b28185eacf6a7285943e45599108d54686

    # Restore the image
    $ docker load -i ./exports/docker-test-1_latest.tar.gz
    Loaded image: docker-test-1:latest

    $ docker image list
    ...
    ```
