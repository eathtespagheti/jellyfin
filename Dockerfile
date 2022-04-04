FROM ghcr.io/linuxserver/jellyfin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y gpg-agent wget
RUN wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | apt-key add -
RUN echo 'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main' >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install --only-upgrade -y intel-media-va-driver-non-free
RUN apt-get remove gpg-agent wget -y
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN apt-get install -y ffmpeg
RUN mv /usr/lib/jellyfin-ffmpeg/ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg.bak
RUN ln -f /usr/bin/ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg
