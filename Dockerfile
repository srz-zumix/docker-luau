FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
      g++ \
      git \
      make \
      cmake \
      wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/build
RUN git clone https://github.com/Roblox/luau.git /opt/luau && \
    cmake /opt/luau \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-Wno-unused-variable" && \
    cmake --build . --target Luau.Repl.CLI Luau.Analyze.CLI --config Release && \
    cp luau* /usr/local/bin/ && \
    rm -rf /tmp/build

WORKDIR /work
ENTRYPOINT [ "luau" ]
