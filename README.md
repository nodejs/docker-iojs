iojs
=========

[![dockeri.co](http://dockeri.co/image/_/iojs)](https://registry.hub.docker.com/_/iojs/)

[![issues](https://img.shields.io/github/issues/iojs/docker-iojs.svg) ![starts](https://img.shields.io/github/stars/iojs/docker-iojs.svg)](https://github.com/iojs/docker-iojs)


The official iojs docker image, made with love by the iojs community.

## What is iojs?
*from [iojs.org/faq.html](https://iojs.org/faq.html)*

io.js is a JavaScript platform built on Chrome's V8 runtime. This project began as a fork of Joyent's Node.js™ and is compatible with the npm ecosystem.

Why? io.js aims to provide faster and predictable release cycles. It currently merges in the latest language, API and performance improvements to V8 while also updating libuv and other base libraries.

This project aims to continue development of io.js under an "open governance model" as opposed to corporate stewardship.

## Usage

If you want to distribute your application on the docker registry, create a `Dockerfile` in the root of application directory:

```
FROM iojs:onbuild

# Expose the ports that your app uses. In Example:
EXPOSE 8080
```

Then simply run:

```
$ docker build -t iojs-app
...
$ docker run --rm -it iojs-app
```

To run a single script, you can mount it in a volume under `/usr/src/app`. From the root of your application directory (assuming your script is named `index.js`):

```
$ docker run -v ${PWD}:/usr/src/app -w /usr/src/app -it --rm iojs iojs index.js
```
