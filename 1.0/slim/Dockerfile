FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      build-essential \
      pkg-config \
      git \
      python \
  && rm -rf /var/lib/apt/lists/*

# verify gpg and sha256: https://iojs.org/dist/v1.0.0/SHASUMS256.txt.gpg
# gpg: aka "Rod Vagg <rod@vagg.org>"
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys C273792F7D83545D

ENV IOJS_VERSION 1.0.2
ENV NPM_VERSION 2.2.0

RUN curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/iojs-v$IOJS_VERSION-linux-x64.tar.gz" \
  && curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/SHASUMS256.txt.asc" \
  && gpg --verify SHASUMS256.txt.asc \
  && grep " iojs-v$IOJS_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "iojs-v$IOJS_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "iojs-v$IOJS_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
  && npm install -g npm@"$NPM_VERSION" \
  && npm cache clear

CMD [ "iojs" ]
