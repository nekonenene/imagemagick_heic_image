# Dockerfile for ImageMagick with HEIC/HEIF support

When you need to convert `.heic` file (HEIF file format), this docker image will be useful.

## Build

```sh
docker build . -t imagemagick_heic
```

## Run

```sh
docker run -it --rm imagemagick_heic /bin/bash
```

Then, you can check ImageMagick version

```sh
convert -version
```
