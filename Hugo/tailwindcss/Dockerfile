# Dockerfile to build a hugo site with tailwindcss
# Ports:
#	1313: Hugo server
# Directories:
# /home/aj: Site and scripts
#   /site: Hugo site
#	dev.sh: Run the Hugo server with live reload
#	prod.sh: Run Hugo to generate the static site	
# /usr/local/go/: Go
# /usr/local/bin/hugo: Hugo executable

# Use official Node image as the base
ARG NODE_VERSION=latest
FROM node:${NODE_VERSION}

# Go and Hugo version
ARG GO_VERSION=1.24.5
ARG HUGO_VERSION=latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git

# Temp dir as the work dir
WORKDIR /var/tmp

# Install Go to /usr/local/go/
RUN set -eu && \
	# Determine architecture
	case $(uname -m) in \
		aarch64) export ARCH=arm64 ;; \
		*) export ARCH=amd64 ;; \
	esac && \
	# Download and install Go
	wget -O go${GO_VERSION}.linux-${ARCH}.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-${ARCH}.tar.gz && \
	tar -C /usr/local -xzf go${GO_VERSION}.linux-${ARCH}.tar.gz && \
	rm go${GO_VERSION}.linux-${ARCH}.tar.gz	

# Export Go path
ENV PATH=$PATH:/usr/local/go/bin

# Install Hugo (extended) to /usr/local/bin/hugo
RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@${HUGO_VERSION}
RUN cp /root/go/bin/hugo /usr/local/bin/hugo

# Clean up temp
RUN rm -rf /var/tmp/*

#------------------------------------------------------------------------------
# Setup new Hugo site and template
WORKDIR /home/aj
RUN /usr/local/bin/hugo new site site --format yaml
WORKDIR /home/aj/site
RUN /usr/local/bin/hugo new theme example --format yaml
RUN echo "theme: example" > ./hugo.yaml
RUN cp -R ./themes/example/content/* ./content/

RUN npm init -y

# Install TailwindCSS
RUN npm install --save-dev tailwindcss @tailwindcss/cli

# input.css is the file you change and add styles to
RUN echo '@import "tailwindcss";' > ./themes/example/assets/css/input.css

# Add example tailwind
RUN sed -i -e 's/<body>/<body class="mx-16 bg-slate-300">/g' ./themes/example/layouts/baseof.html

# Copy scripts
WORKDIR /home/aj
COPY --chmod=0755 scripts/container/ .

#------------------------------------------------------------------------------
# Container ports and entry point
EXPOSE 1313

# Override the default node entry point
ENTRYPOINT [""]
