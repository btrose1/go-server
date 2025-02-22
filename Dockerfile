ARG IMAGE=ubuntu
ARG TAG=24.04

FROM ${IMAGE}:${TAG}

RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    vim \
    zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV GO_VERSION=1.23.6
RUN curl -s https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz

SHELL ["/usr/bin/zsh", "-o", "pipefail", "-c"]

# Download and install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

ENV PATH=/usr/local/go/bin:$PATH

CMD /usr/bin/zsh
