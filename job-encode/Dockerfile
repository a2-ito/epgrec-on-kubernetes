FROM ubuntu:latest

RUN ls -l /usr/local/bin/

RUN apt update -y && apt install -y git autoconf libtool make gcc g++ wget yasm nasm bzip2 libass-dev

# build fdk-aac
RUN git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
RUN cd fdk-aac && autoreconf -fiv && ./configure && make && make install

# build lame
RUN git clone https://github.com/gypified/libmp3lame.git
RUN cd libmp3lame && ./configure && make && make install

# build opus
RUN git clone git://github.com/xiph/opus.git
RUN cd opus && autoreconf -fiv && ./configure --disable-shared --with-pic && make -j && make install

# build x264
RUN git clone https://code.videolan.org/videolan/x264.git
RUN cd x264 && ./configure --enable-static --enable-pic --disable-asm && make -j && make install

#ffmpeg
RUN mkdir /tmp/ffmpeg_sources && cd /tmp/ffmpeg_sources && wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && tar xjvf ffmpeg-snapshot.tar.bz2
RUN cd /tmp/ffmpeg_sources/ffmpeg && \
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure \
  --prefix=/usr/local \
  --disable-shared \
  --pkg-config-flags=--static \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libx264 \
  --enable-nonfree
RUN cd /tmp/ffmpeg_sources/ffmpeg && make && make install

RUN ls -l /usr/local/bin/

FROM php:zts-buster

CMD ["/usr/sbin/init"]

