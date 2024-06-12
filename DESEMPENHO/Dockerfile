FROM ubuntu:20.04

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
    python3-pip \
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
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Install matplotlib for plotting
RUN pip3 install matplotlib

# Clone and build perf
RUN git clone --depth=1 https://github.com/microsoft/WSL2-Linux-Kernel.git /usr/src/wsl2-linux-kernel 
WORKDIR /usr/src/wsl2-linux-kernel/tools/perf 
RUN make -j8 
RUN cp perf /usr/local/bin

# Copy the C source files into the container
COPY fatrec.c /usr/src/myapp/
COPY fat.c /usr/src/myapp/
COPY integers.c /usr/src/myapp/
COPY floating.c /usr/src/myapp/
COPY wfile.c /usr/src/myapp/

# Copy the script to run the tests
COPY run_tests.sh /usr/src/myapp/
# Copy the script to plot the results
COPY plot.py /usr/src/myapp/

# Convert line endings of the script
RUN dos2unix /usr/src/myapp/run_tests.sh

# Set the working directory
WORKDIR /usr/src/myapp

# Compile the C programs
RUN gcc -o fatorial_recursivo fatrec.c \
    && gcc -o fatorial_iterativo fat.c \
    && gcc -o divisao_inteiros integers.c \
    && gcc -o divisao_float floating.c \
    && gcc -o operacoes_arquivo wfile.c

# Make the scripts executable
RUN chmod +x /usr/src/myapp/run_tests.sh
RUN chmod +x /usr/src/myapp/plot.py

# Run the tests and plot the results when the container starts
CMD ["/bin/bash", "-c", "./run_tests.sh"]