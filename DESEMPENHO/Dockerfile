# Use an Ubuntu-based image
FROM ubuntu:20.04

# Set the environment to noninteractive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    flex \
    bison \
    libssl-dev \
    libelf-dev \
    git \
    python3 \
    libdw-dev \
    systemtap-sdt-dev \
    libnuma-dev \
    libbabeltrace-dev \
    libperl-dev \
    python-dev \
    binutils-dev \
    libiberty-dev \
    liblzma-dev \
    libzstd-dev \
    libcap-dev \
    && rm -rf /var/lib/apt/lists/*


RUN git clone --depth=1 https://github.com/microsoft/WSL2-Linux-Kernel.git /usr/src/wsl2-linux-kernel 
WORKDIR /usr/src/wsl2-linux-kernel/tools/perf 
RUN make -j8 
RUN cp perf /usr/local/bin

# Copy the source code into the container
COPY . /usr/src/myapp

# Set the working directory
WORKDIR /usr/src/myapp

# Compile the C programs
RUN gcc -o fatorial_recursivo fatrec.c \
    && gcc -o fatorial_iterativo fat.c \
    && gcc -o divisao_inteiros integers.c \
    && gcc -o divisao_float floating.c \
    && gcc -o operacoes_arquivo wfile.c

# Copy the script to run the tests
COPY run_tests.sh /usr/src/myapp/

# Make the script executable
RUN chmod +x /usr/src/myapp/run_tests.sh

# Run the script when the container starts
CMD ["./run_tests.sh"]
