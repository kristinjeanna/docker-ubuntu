# kristinjeanna-ubuntu

A Docker image based on `ubuntu:rolling` that serves as the base image for my downstream Ubuntu-based Docker images. Includes `tini` as the PID 0 process.

## How to obtain and use this image

1. Clone this repo
1. [Manually building the image](#building-the-image)
    1. [For MacOS and Linux](#method-1)
    1. [For Windows](#method-2)
1. [Run the image](#run-the-image) or use as base image for another image

## Manually building the image

The following two build methods will create a Docker image with the latest rolling release of Ubuntu with latest updates applied. The image will be labelled `kristinjeanna/ubuntu:latest` and can be used to construct downstream images.

### Method 1

For use on a MacOS or Linux system. At a bash prompt, `cd` to the source directory of the cloned repo, and build with:

```
./build.sh
```

This script will scrub a previous `kristinjeanna/ubuntu` image prior to performing the build.

### Method 2

For building on a Windows system running Docker. In a command prompt, `cd` to the source directory of the cloned repo, and build with:

```
docker build -t kristinjeanna/ubuntu -f Dockerfile context
```

## Run the image

The following runs the image and results in a bash prompt in the running container:

```
docker run -ti --rm kristinjeanna/ubuntu
```

## See also

* [tini](https://github.com/krallin/tini) init
