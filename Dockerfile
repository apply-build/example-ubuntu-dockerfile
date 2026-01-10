# Ubuntu base image with common network debugging tools.

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      dnsutils \
      iproute2 \
      iputils-ping \
      netcat-openbsd \
      tcpdump \
      traceroute \
      openssl \
      procps \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user with a numeric UID/GID (helps with runAsNonRoot enforcement).
#RUN groupadd -g 65532 app && useradd -m -u 65532 -g 65532 -s /bin/bash app
#USER 65532:65532

WORKDIR /home/app

# Keep container running and provide a shell-friendly default.
CMD ["/bin/bash"]
