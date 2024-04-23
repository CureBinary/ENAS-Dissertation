FROM --platform=linux/amd64 python:2.7.18-stretch
RUN echo "deb http://archive.debian.org/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
    && echo "deb-src http://archive.debian.org/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security/ stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://archive.debian.org/debian-security/ stretch/updates main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    pkg-config \
    libhdf5-dev
COPY . /enas
WORKDIR /enas
CMD ["bash", "-c", "while true; do sleep 30; done"]
