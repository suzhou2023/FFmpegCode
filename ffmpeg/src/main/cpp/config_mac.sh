#!/bin/bash
make clean


 ./configure \
    --prefix=../build/mac \
    --disable-x86asm \
    --enable-shared \
    --disable-swscale \
    --disable-postproc \
    --disable-encoders \
    --disable-decoders \
    --disable-demuxers \
    --disable-muxers \
    --disable-protocols \
    --disable-filters \
    --disable-bsfs \
    --disable-parsers \
    --enable-decoder=h264 \
    --enable-decoder=mjpeg \
    --enable-decoder=mpeg4 \
    --enable-muxer=h264 \
    --enable-demuxer=h264 \
    --enable-protocol=rtp \
    --enable-protocol=tcp \
    --enable-protocol=udp \
