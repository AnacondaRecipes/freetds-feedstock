#!/bin/bash

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

set -e

./configure \
  --enable-krb5 \
  --prefix=$PREFIX \
  --with-unixodbc=$PREFIX \
  --with-openssl=$PREFIX \
  --with-krb5=$PREFIX \
  --host=$HOST \
  --build=$BUILD
make -j${CPU_COUNT}
# To run this check we need to have access to a mssql instance.
# make check
make install
