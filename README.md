# iojs

[![dockeri.co](http://dockeri.co/image/_/iojs)](https://registry.hub.docker.com/_/iojs/)

[![GitHub issues](https://img.shields.io/github/issues/nodejs/docker-iojs.svg "GitHub issues")](https://github.com/nodejs/docker-iojs)
[![GitHub stars](https://img.shields.io/github/stars/nodejs/docker-iojs.svg "GitHub stars")](https://github.com/nodejs/docker-iojs)

The official iojs docker image, made with love by the iojs community.

## What is iojs?

*from [iojs.org/faq.html](https://iojs.org/faq.html)*

io.js is a JavaScript platform built on Chrome's V8 runtime. This project began
as a fork of Joyent's Node.js™ and is compatible with the npm ecosystem.

Why? io.js aims to provide faster and predictable release cycles. It currently
merges in the latest language, API and performance improvements to V8 while also
updating libuv and other base libraries.

This project aims to continue development of io.js under an "open governance
model" as opposed to corporate stewardship.

## Usage

# How to use this image

If you want to distribute your application on the docker registry, create a
`Dockerfile` in the root of application directory:

```Dockerfile
FROM iojs:onbuild

# Expose the ports that your app uses. For example:
EXPOSE 8080
```

Then simply run:

```
$ docker build -t iojs-app
...
$ docker run --rm -it iojs-app
```

To run a single script, you can mount it in a volume under `/usr/src/app`. From
the root of your application directory (assuming your script is named
`index.js`):

```
$ docker run -v ${PWD}:/usr/src/app -w /usr/src/app -it --rm iojs iojs index.js
```

# Image Variants

The `iojs` images come in many flavors, each designed for a specific use case.

## `iojs:<version>`

This is the defacto image. If you are unsure about what your needs are, you
probably want to use this one. It is designed to be used both as a throw away
container (mount your source code and start the container to start your app),
as well as the base to build other images off of. This tag is based off of
[`buildpack-deps`](https://registry.hub.docker.com/_/buildpack-deps/).
`buildpack-deps` is designed for the average user of docker who has many images
on their system. It, by design, has a large number of extremely common Debian
packages. This reduces the number of packages that images that derive from it
need to install, thus reducing the overall size of all images on your system.

## `iojs:onbuild`

This image makes building derivative images easier. For most use cases,
creating a `Dockerfile` in the base of your project directory with the line
`FROM iojs:onbuild` will be enough to create a stand-alone image for your
project.

## `iojs:slim`

This image does not contain the common packages contained in the default tag
and only contains the minimal packages needed to run `iojs`. Unless you are
working in an environment where *only* the iojs image will be deployed and you
have space constraints, we highly recommend using the default image of this
repository.

# License

[License information](https://github.com/nodejs/io.js/blob/master/LICENSE) for
the software contained in this image. [License
information](https://github.com/nodejs/docker-iojs/blob/master/LICENSE) for the
io.js Docker project.

# Supported Docker versions

This image is officially supported on Docker version 1.5.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# People

Current Project Team Members:

 * [@chorrell](https://github.com/chorrell)
 * [@hmalphettes](https://www.github.com/hmalphettes)
 * [@jlmitch5](https://www.github.com/jlmitch5)
 * [@pesho](https://www.github.com/pesho)
 * [@Starefossen](https://www.github.com/starefossen)
 * [@wblankenship](https://www.github.com/wblankenship)
