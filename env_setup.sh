#!/bin/bash

# Check if the OPT_HOME argument is provided
if [ -z "$1" ]; then
    echo "your OPT_HOME directory not provided. Please provide it as the first argument."
    echo "you can run this script as $./env_setup.sh /home/[yournetid]/opt-dev or $./env_setup.sh ~/opt-dev"
    exit 1
fi

# Set OPT_HOME to the first argument
OPT_HOME="$1"

export CASCADE_INSTALL_PREFIX=${OPT_HOME}
export DERECHO_INSTALL_PREFIX=${OPT_HOME}
export VORTEX_INSTALL_PREFIX=${OPT_HOME}

export FAISS_INSTALL_PREFIX=${OPT_HOME}
export CURL_INSTALL_PREFIX=${OPT_HOME}/
export HNSWLIB_INSTALL_PREFIX=${OPT_HOME}/
export CMAKE_PREFIX_PATH=${OPT_HOME}/
export C_INCLUDE_PATH=${OPT_HOME}/include/
export CPLUS_INCLUDE_PATH=${OPT_HOME}/include/
export LIBRARY_PATH=${OPT_HOME}/lib/
export LD_LIBRARY_PATH=${OPT_HOME}/lib/
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CUDAToolKitRoot=/usr/local/cuda-12.3
export PYTHONPATH=$PYTHONPATH:${OPT_HOME}/lib/
export PYTHONPATH=$PYTHONPATH:${OPT_HOME}/bin/
export PATH=$PATH:${OPT_HOME}/bin
export PATH=$PATH:/home/yy354/.local/bin
export PATH=/usr/local/cuda/bin:$PATH

echo "Environment variables have been set with OPT_HOME: $OPT_HOME"

