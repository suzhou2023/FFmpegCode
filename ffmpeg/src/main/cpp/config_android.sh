#!/bin/bash
make clean
set -e
archbit=64

if [ $archbit -eq 64 ];then
echo "build for 64bit"
ARCH=aarch64
CPU=armv8-a
API=21
PLATFORM=aarch64
ANDROID=android
CFLAGS=""
LDFLAGS=""
else
echo "build for 32bit"
ARCH=arm
CPU=armv7-a
API=16
PLATFORM=armv7a
ANDROID=androideabi
CFLAGS="-mfloat-abi=softfp -march=$CPU"
LDFLAGS="-Wl,--fix-cortex-a8"
fi

export NDK=/Users/suzhou/Library/Android/sdk/ndk/23.1.7779620
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin
export SYSROOT=$NDK/toolchains/llvm/prebuilt/darwin-x86_64/sysroot
export CROSS_PREFIX=$TOOLCHAIN/$ARCH-linux-$ANDROID$API
export CC=$CROSS_PREFIX-clang
export CXX=$CROSS_PREFIX-clang++
export PREFIX=../build/$CPU

 ./configure \
    --prefix=$PREFIX \
    --cross-prefix=$CROSS_PREFIX \
    --target-os=android \
    --arch=$ARCH \
    --cpu=$CPU \
    --cc=$CC \
    --cxx=$CXX \
    --nm=$TOOLCHAIN/llvm-nm \
    --ar=$TOOLCHAIN/llvm-ar \
    --strip=$TOOLCHAIN/llvm-strip \
    --pkg-config=$TOOLCHAIN/llvm-config \
    --ranlib=$TOOLCHAIN/llvm-ranlib \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="$CFLAGS" \
    --extra-ldflags="$LDFLAGS" \
    --extra-ldexeflags=-pie \
    --disable-debug \
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
