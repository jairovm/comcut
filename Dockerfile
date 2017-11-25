FROM ubuntu:16.04

# Update and get dependencies
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
       python3 \
       git \
       build-essential \
       libargtable2-dev \
       autoconf \
       libtool-bin \
       ffmpeg \
       libsdl1.2-dev \
       libavutil-dev \
       libavformat-dev \
       libavcodec-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*    
      
# Clone Comskip
RUN cd /opt \
  && git clone git://github.com/erikkaashoek/Comskip \
  && cd Comskip \
  && ./autogen.sh \
  && ./configure \
  && make

COPY comcut comcut-wrapper /usr/bin/

RUN chmod +x /usr/bin/comcut*

#ENTRYPOINT [ "/usr/bin/comcut-wrapper" ]
