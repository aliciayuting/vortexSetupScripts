#!/bin/bash

# install CMake version 3.15.4
# Check if the CMAKE_INSTALL_PREFIX environment variable is set to ~/.local/bin
if [ -z "$CMAKE_INSTALL_PREFIX" ]; then
    echo "Error: CMake installation environment variable is not set. Please set it via running the env_setup.sh script and try again."
    exit 1
fi

# Clone the cmake repository and check out the specified version
wget https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0.tar.gz
tar -xvzf cmake-3.31.4.tar.gz

cd cmake-3.15.4
./bootstrap --prefix=$CMAKE_INSTALL_PREFIX
make -j$(nproc)
make install




