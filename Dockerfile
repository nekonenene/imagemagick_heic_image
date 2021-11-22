FROM ubuntu:18.04

WORKDIR /home

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    curl \
    git

RUN apt-get build-dep -y imagemagick

RUN apt-get install -y \
    libde265-dev \
    libopenjp2-7-dev \
    librsvg2-dev \
    libwebp-dev

RUN git clone https://github.com/strukturag/libheif.git
WORKDIR /home/libheif
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN cd ..

WORKDIR /home

RUN mkdir ImageMagick
RUN curl -L https://www.imagemagick.org/download/ImageMagick.tar.gz | tar zx -C ImageMagick --strip-components 1
WORKDIR /home/ImageMagick
RUN ./configure
RUN make
RUN make install
RUN cd ..

WORKDIR /home

RUN ldconfig
RUN rm -rf libheif ImageMagick

CMD ["/bin/bash"]
