#!/bin/bash

if [ -n "$ANDROID_BUILD_TOP" ] ; then
  echo "Type 'mma' after lunch to build in Android Repo"
  exit
fi

rm lua.zip
cd src && \
make && \
make install && \
cd ../luasocket && \
make && \
make install && \
cd .. && \
cp -r ase/android json4lua/json build/lua/share/lua/5.1 && \
cd build && \
zip -r ../lua.zip lua && \
echo "SUCCESS"
