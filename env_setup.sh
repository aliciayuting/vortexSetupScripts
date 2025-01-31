#!/bin/bash

# Check if the OPT_HOME argument is provided
if [ -z "$1" ]; then
    echo "your USER_HOME directory not provided. Please provide it as the first argument."
    echo "you can run this script as $./env_setup.sh /home/[yournetid] or $./env_setup.sh ~"
    exit 1
fi

# Set OPT_HOME to the first argument
USER_HOME=$(echo "$1" | sed 's:/*$::')
OPT_HOME=${USER_HOME}/opt-dev

export CMAKE_INSTALL_PREFIX=${USER_HOME}/.local
export CASCADE_INSTALL_PREFIX=${OPT_HOME}
export DERECHO_INSTALL_PREFIX=${OPT_HOME}
export VORTEX_INSTALL_PREFIX=${OPT_HOME}

export SPDLOG_PREFIX=${OPT_HOME}
export FAISS_INSTALL_PREFIX=${OPT_HOME}
export CURL_INSTALL_PREFIX=${OPT_HOME}/
export HNSWLIB_INSTALL_PREFIX=${OPT_HOME}/
export CMAKE_PREFIX_PATH=${OPT_HOME}/
export C_INCLUDE_PATH=${OPT_HOME}/include/:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${OPT_HOME}/include/
export LIBRARY_PATH=${OPT_HOME}/lib/:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${OPT_HOME}/lib/
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
export CUDAToolKitRoot=/usr/local/cuda-12.3
export PYTHONPATH=$PYTHONPATH:${OPT_HOME}/lib/
export PYTHONPATH=$PYTHONPATH:${OPT_HOME}/bin/
export PATH=${USER_HOME}/.local/bin:$PATH
export PATH=${OPT_HOME}/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH

echo "Environment variables have been set with OPT_HOME: $OPT_HOME"

