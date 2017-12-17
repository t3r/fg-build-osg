FROM opensuse:latest
  
RUN zypper in -y \
  cairo-devel \
  cmake \
  freetype2-devel \
  gcc-c++ \
  git \
  gstreamer-devel \
  qt3-devel \
  gtk2-devel \
  gtkglext-devel \
  libcurl-devel \
  libjasper-devel \
  libjpeg8-devel \
  libpng16-devel \
  libpoppler-devel \
  libSDL-devel \
  libSDL2-devel \
  libtiff-devel \
  libxml2-devel \
  libXrandr-devel \
  Mesa-devel \
  zlib-devel \
  && zypper clean -a

RUN groupadd -g 1000 flightgear && useradd -u 1000 -g 1000 -m flightgear
USER flightgear
WORKDIR /home/flightgear
