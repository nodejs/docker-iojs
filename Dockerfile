FROM debian:wheezy

RUN apt-get update && apt-get install -y \
		ca-certificates \
		curl

ENV NODE_VERSION 0.10.30

# TODO verify gpg and sha256: http://nodejs.org/dist/v0.10.30/SHASUMS256.txt.asc
RUN curl -SL "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
		| tar -xzC /usr/local --strip-components=1

CMD [ "node" ]
