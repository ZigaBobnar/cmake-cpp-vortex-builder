FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y build-essential \
    sudo \
    wget \
    git \
    python3 \
    python3-pip

# Install boost 1.72.0
RUN cd /opt \
    && wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz \
    && tar xf boost_1_72_0.tar.gz \
    && cd boost_1_72_0 \
    && ./bootstrap.sh \
    && ./b2 \
    && cd .. \
    && rm boost_1_72_0.tar.gz
