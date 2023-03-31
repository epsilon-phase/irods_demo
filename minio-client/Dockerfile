FROM ubuntu:20.04

SHELL [ "/bin/bash", "-c" ]

ENV DEBIAN_FRONTEND=noninteractive

# Make sure we're starting with an up-to-date image
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*
# To mark all installed packages as manually installed:
#apt-mark showauto | xargs -r apt-mark manual

RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ccache \
        g++-10 \
        gcc \
        gcc-10 \
        git \
        gnupg \
        help2man \
        libbz2-dev \
        libcurl4-gnutls-dev \
        libfuse-dev \
        libjson-perl \
        libkrb5-dev \
        libpam0g-dev \
        libssl-dev \
        libxml2-dev \
        lsb-release \
        lsof \
        make \
        ninja-build \
        odbc-postgresql \
        postgresql \
        python3 \
        python3-dev \
        python3-pip \
        python3-distro \
        python3-jsonschema \
        python3-packaging \
        python3-psutil \
        python3-pyodbc \
        python3-requests \
        sudo \
        super \
        unixodbc-dev \
        wget \
        zlib1g-dev \
	curl \
    && \
    pip3 --no-cache-dir install lief && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*


ENV PATH=$PATH:$HOME/minio-binaries/

RUN pip install botocore
RUN echo $PATH

COPY demo.sh .
COPY botocore-demo.py .

ENTRYPOINT bash demo.sh
