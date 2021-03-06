#! /bin/sh

[ -d dist ] && rm -Rf dist

if ! [ -x thirdparty/chrpath/chrpath ] ; then
	cd thirdparty/chrpath
	./configure && make
	cd ../..
fi

mkdir -p dist/libs

cp libs/libz.so dist/libs/libz.so.1
cp libs/libbz2.so dist/libs/libbz2.so.1.0

cp libs/libpng16.so dist/libs/libpng16.so.16
cp libs/libjpeg.so dist/libs/libjpeg.so.9
cp libs/libopenjp2.so dist/libs/libopenjp2.so.7
cp libs/libjbig2dec.so dist/libs/libjbig2dec.so.0

cp libs/libfreetype.so dist/libs/libfreetype.so.6
cp libs/libharfbuzz.so dist/libs/libharfbuzz.so.0

cp libs/libdjvulibre.so dist/libs/libdjvulibre.so.21
cp libs/libmupdf.so dist/libs
cp libs/libmupdfwrapper.so dist/libs

cp -R hyphenation-patterns dist
cp -R bin dist
cp -R scripts dist
cp -R icons dist
cp -R fonts dist
cp -R css dist
cp target/arm-unknown-linux-gnueabihf/release/plato dist/

./thirdparty/chrpath/chrpath -d dist/libs/*

arm-linux-gnueabihf-strip dist/plato dist/libs/*
