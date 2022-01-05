./configure --enable-shared --disable-avdevice --disable-doc --disable-devices --enable-libsrt --enable-ffplay --enable-libfdk-aac --enable-libx264 --enable-libx265 --enable-libvpx --enable-libopus --enable-sdl2 --enable-nonfree --disable-asm --enable-gpl --extra-ldflags="-lpthread -lssl -lcrypto" --extra-libs=-ldl --pkgconfigdir=/usr/local/lib/pkgconfig --extra-cflags="-fno-stack-check" --enable-cross-compile 

make -j 4

make install


