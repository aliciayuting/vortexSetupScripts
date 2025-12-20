#!/bin/bash

# Fractus shall already have these installed, but in case of a fresh setup:
# Install pip packages to user space
# python3 -m pip install --user --upgrade pip setuptools wheel
# Install PyTorch to user space
# pip install --user torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118


# CURR_DIR=$(pwd)
# # Install nemo_toolkit to user space
# pip install --user nemo_toolkit['all'] 

# # Install requirements to user space
pip install --user -r ppl1_requirements.txt
# pip install --user -r ppl2_requirements.txt


echo "finished pip installation"

cd ~

WORK_DIR=~/workspace
if [ ! -d "$WORK_DIR" ]; then
    echo "Creating $WORK_DIR directory..."
    mkdir -p "$WORK_DIR"
    echo "Directory created: $WORK_DIR"
fi

cd workspace
# Use the FLMR with TC's fix
git clone https://github.com/tcyuan373/FLMR.git
cd FLMR
pip install --user -e . 

pip install --user colbert-ai

echo "finished flmr installation"

# Return to the original directory
cd "$CURR_DIR"

# Run the Python script
python prepare_FLMR.py
echo "finished flmr initialization"

git clone https://github.com/aliciayuting/SenseVoice.git