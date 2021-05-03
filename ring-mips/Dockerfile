FROM rustembedded/cross:mips-unknown-linux-musl-0.2.1

RUN apt-get update && apt-get install -y \
    gcc-mipsel-linux-gnu \
    libc6-dev-mipsel-cross \
    && rm -rf /var/lib/apt/lists/*


ENV TARGET_CC=mips-linux-muslsf-gcc
ENV TARGET_AR=""