# Dockerfile for ImageMagick with HEIC/HEIF support

When you need to convert `.heic` file (HEIF file format), this docker image will be useful.

## Build

```sh
docker build . -t imagemagick_heic
```

## Run

```sh
docker run -it --name imagemagick_heic --rm imagemagick_heic /bin/bash
```

Then, you can check ImageMagick version

```sh
convert -version
```

### Convert HEIF(.heic) file to JPEG(.jpg)

1. Send HEIF(`.heic`) file to the container
    ```sh
    # Command from outside of the container
    docker cp /path/to/file.heic imagemagick_heic:/home
    ```
2. Convert HEIF(`.heic`) file to JPEG(`.jpg`)
    ```sh
    # Command from the container
    mogrify -format jpg *.heic
    ```
3. Send JPEG(`.jpg`) file to outside of the container
    ```sh
    # Command from outside of the container
    docker cp imagemagick_heic:/home/file.jpg .
    ```
