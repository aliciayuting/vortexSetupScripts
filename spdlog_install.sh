#!/bin/bash

# Check if the SPDLOG_PREFIX environment variable is set
if [ -z "$SPDLOG_PREFIX" ]; then
    echo "Error: SPDLOG installation environment variable is not set. Please set it via running the env_setup.sh script and try again."
    exit 1
fi

# Clone the spdlog repository and check out the specified version
git clone --branch v1.12.0 https://github.com/gabime/spdlog.git
cd spdlog
mkdir -p build && cd build

# Use the OPT_HOME variable for the CMAKE_INSTALL_PREFIX
cmake .. -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${SPDLOG_PREFIX}

# Build and install
make -j32
make install

# Verify if the library was installed in the correct location
LIB_PATH="${SPDLOG_PREFIX}/lib/libspdlog.a"

if [ -f "$LIB_PATH" ]; then
    echo "Library successfully installed: $LIB_PATH"
else
    echo "Error: Library not found at expected location: $LIB_PATH"
fi
