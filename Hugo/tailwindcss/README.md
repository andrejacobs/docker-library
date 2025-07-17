# Hugo static site generator with TailwindCSS

This can be used as the initial scaffolding for a new [Hugo](https://gohugo.io/) site with TailwindCSS support.

TailwindCSS is used to compile the input file "themes/example/assets/css/input.css" and source html files to "themes/example/assets/css/main.css".

## Quickstart

-   Clone this repository: `git clone https://github.com/andrejacobs/docker-library`
-   `cd ./docker-library/Hugo/tailwindcss`
-   `make build && make dev`
-   Access the development server: http://localhost:1313
-   Make a change to the ./site or ./content and watch the page change.

## Docker container

The Dockerfile is used to build a container image that contains hugo, go, node.js (npm) and the site.

-   The hugo server runs on the default port of 1313.
-   The site and scripts are located at: `/home/aj`.
-   Hugo extended is installed at: `/usr/local/bin/hugo`.
-   Go toolchain is installed at: `/usr/local/go/`.

Using the container image:

-   Build container image: `make build`.
-   Run container while being able to develop on local files: `make dev`.
    -   A local ./site and ./content will be created from the initial container image's files.
    -   The local ./site, ./public and ./content will be volume mapped into the container
        and thus you can make changes while live reloading the site.
    -   Access the site: http://localhost:1313.
-   Generate the static site ready to deploy. `make public`.
    -   The local ./public directory will contain the complete site that can be deployed.
-   Debug the container by attaching a shell to inspect it: `make attach`.
-   Build and export the latest site image to a .tar.gz: `make export-image`.
-   Import the .tar.gz image: `docker load -i ./exports/${IMAGE_TAG}_latest.tar.gz`

## Note

-   The `.gitignore` ignores the ./site, ./public and ./content. You probably want to commit ./content to your own fork.
