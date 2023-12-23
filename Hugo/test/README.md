# Hugo test site

This serves as an example of how to use the Hugo docker images built by this repo.

## Build, run and serve the test site

Run the shell script `docker-build-run.sh` from this same directory.

It will build the ../base/Dockerfile image and tag it as `aj-hugo-base` and then run a temporary container to serve the quickstart site files.

## Steps followed to create the test site

The following are the steps I followed on my Mac to build the test site files locally.
See the official Hugo guide for more details: https://gohugo.io/getting-started/quick-start/

-   Installed hugo locally (to make the process easier to just get the initial files). `brew install hugo`.

-   Create the quickstart guide's site

          $ hugo new site quickstart
          $ cd quickstart
          $ git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
          $ echo "theme = 'ananke'" >> hugo.toml

-   Test using local installed Hugo

          $ hugo server
