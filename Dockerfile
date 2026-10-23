FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates libstdc++6 libgcc-s1 libatomic1 zlib1g \
    libglib2.0-0 libnuma1 tzdata python3 python3-pip \
    && python3 -m pip install --no-cache-dir moomoo-api \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV LD_LIBRARY_PATH=/app

ENTRYPOINT ["./OpenD"]
CMD ["-no_monitor=1", "-api_ip=0.0.0.0", "-api_port=11111"]
