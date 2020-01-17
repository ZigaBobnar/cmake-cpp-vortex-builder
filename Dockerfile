FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y build-essential \
    sudo \
    wget \
    git \
    openssl \
    libssl-dev \
    python3 \
    python3-pip

# Install boost 1.72.0
RUN cd /opt \
    && wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz \
    && tar xf boost_1_72_0.tar.gz \
    && cd boost_1_72_0 \
    && ./bootstrap.sh \
    && ./b2 -j 8 \
    && cd .. \
    && rm boost_1_72_0.tar.gz

# Install cmake 3.16.2 
RUN cd /usr/local/src \
    && wget https://github.com/Kitware/CMake/releases/download/v3.16.2/cmake-3.16.2.tar.gz \
    && tar xvf cmake-3.16.2.tar.gz \
    && cd cmake-3.16.2 \
    && ./bootstrap \
    && make -j8 \
    && make install \
    && cd .. \
    && rm -rf cmake*

# Install mongo-c-driver 1.16.0
RUN apt-get install -y libsasl2-dev \
    && cd /usr/local/src \
    && wget https://github.com/mongodb/mongo-c-driver/releases/download/1.16.0/mongo-c-driver-1.16.0.tar.gz \
    && tar xzf mongo-c-driver-1.16.0.tar.gz \
    && cd mongo-c-driver-1.16.0 \
    && mkdir cmake-build \
    && cd cmake-build \
    && cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. \
    && make -j8 \
    && make install \
    && cd ../.. \
    && rm -rf mongo-c-driver*
