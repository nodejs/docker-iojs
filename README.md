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

```Dockerfile
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

## Image Varients

The `iojs` images come in three flavors, each designed for a specific use case. 

`<version>`:

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

`<version>-onbuild`:

This image makes building derivitative images easier. For most use cases, creating a `Dockerfile` in the base of your project directory with the line `FROM iojs:onbuild` will be enough to create a stand-alone image for your project.

`<version>-slim:`

The default tag is based off of `buildpack-deps`.`buildpack-deps` is designed for the average user of docker who has many images on thier system. It, by design, has a large number of extremely common debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the total size of all of your docker images on your system. Unless you are working in an environment where *only* the iojs image will be deployed and you have space constraints, we highly recommend using the default image of this repository.
