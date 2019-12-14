FROM ubuntu:18.04

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list

RUN apt update

RUN apt install -y \
    build-essential \
    curl \
    git

RUN apt build-dep -y imagemagick

RUN apt install -y \
    libde265-dev \
    libopenjp2-7-dev \
    librsvg2-dev \
    libwebp-dev

RUN git clone https://github.com/strukturag/libheif.git && cd libheif
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN cd ..

RUN mkdir ImageMagick
RUN curl https://www.imagemagick.org/download/ImageMagick.tar.gz | tar zx -C ImageMagick --strip-components 1
RUN cd ImageMagick
RUN ./configure
RUN make
RUN make install
RUN cd ..

RUN ldconfig
RUN rm -rf libheif ImageMagick

CMD ["/bin/bash"]
