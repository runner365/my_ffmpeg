./configure --enable-shared --disable-avdevice --disable-doc --disable-devices --enable-libsrt --enable-libfdk-aac --enable-libx264 --enable-libx265 --enable-nonfree --disable-asm --enable-gpl --enable-libsrt --extra-ldflags="-lpthread -lssl -lcrypto" --extra-libs=-ldl --pkgconfigdir=/usr/local/lib/pkgconfig --extra-cflags="-fno-stack-check" --enable-cross-compile 

make -j 4

make install


