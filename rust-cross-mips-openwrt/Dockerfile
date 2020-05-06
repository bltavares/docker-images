FROM rustembedded/cross:mips-unknown-linux-musl-0.1.16

RUN apt-get update && apt-get install -y \
    llvm-dev \
    clang \
    libclang-dev \
    libc6-dev-i386 \
    && rm -rf /var/lib/apt/lists/*
