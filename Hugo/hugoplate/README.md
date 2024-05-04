# Hugo + Hugoplate in a container

## Initialization

To build the docker image and then get the initial site files run:

```bash
make init
```

The directory `./site` will be created and contain the hugoplate files and initial content.

## Development and content creation

Start the development server:

```bash
make dev
```

Server will be available at http://localhost:1313

Edit the files in `./site` and view the changes in the browser.

## Static files for hosting

To create the `./public` directory with the final website files:

```bash
make static
```

## Debug the created docker image

```bash
make attach
```

## Export the docker image

```bash
make export-image
```

This will save the docker image to `./exports/hugoplate_latest.tar.gz`.

To import on another machine:

```bash
docker load -i ./exports/hugoplate_latest.tar.gz
```
