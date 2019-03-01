#!/bin/bash
apt-get update \
&& export DEBIAN_FRONTEND=noninteractive \
&& apt-get install -y  pkg-config cmake git php-cli php-dev qt5-default

git clone --depth 1 https://github.com/opencv/opencv.git  /usr/local/src/opencv

git clone --depth 1 https://github.com/opencv/opencv_contrib.git /usr/local/src/opencv_contrib

cd /usr/local/src/opencv \
&& mkdir build \
&& cd build \
&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=ON \
-D WITH_V4L=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D BUILD_EXAMPLES=OFF \
-D BUILD_JAVA=OFF \
-D BUILD_TESTS=OFF \
-D WITH_QT=ON \
-D WITH_OPENGL=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..\
&& make -j6 \
&& make install \
&& cd / \
&& sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf' \
&& ldconfig

rm -rf /usr/local/src/opencv \
&& rm -rf /usr/local/src/opencv_contrib \
&& apt-get purge -y cmake \
&& apt-get autoremove -y --purge
