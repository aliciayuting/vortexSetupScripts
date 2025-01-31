
#!/bin/bash

# Check if the BOOST_PREFIX environment variable is set
if [ -z "$BOOST_PREFIX" ]; then
    echo "Error: BOOST installation environment variable is not set."
    echo "Please set it via running the env_setup.sh script and try again."
    exit 1
fi

# Boost version details
BOOST_VERSION="1_74_0"
BOOST_TAR="boost_${BOOST_VERSION}.tar.gz"
BOOST_URL="https://archives.boost.io/release/1.74.0/source/boost_1_74_0.tar.gz"
BOOST_DIR="boost_${BOOST_VERSION}"

# Download and extract Boost
if [ ! -f "$BOOST_TAR" ]; then
    echo "Downloading Boost ${BOOST_VERSION}..."
    wget -q --show-progress "$BOOST_URL"
fi

if [ ! -d "$BOOST_DIR" ]; then
    echo "Extracting Boost..."
    tar -xzf "$BOOST_TAR"
fi

# Change to Boost directory
cd "$BOOST_DIR" || exit 1

# Bootstrap Boost with a custom installation prefix
echo "Bootstrapping Boost..."
./bootstrap.sh --prefix="$BOOST_PREFIX"

# Build and install Boost
echo "Building and installing Boost..."
./b2 install --prefix="$BOOST_PREFIX" -j$(nproc)

# Verify installation
LIB_PATH="${BOOST_PREFIX}/lib/libboost_system.a"

if [ -f "$LIB_PATH" ]; then
    echo "Boost successfully installed at: $BOOST_PREFIX"
else
    echo "Error: Boost library not found at expected location: $LIB_PATH"
    exit 1
fi




