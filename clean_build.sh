#!/bin/bash

# Ask the user for the base directory
read -p "Please enter your base directory (e.g., /home/[yournetid]): " BASE_DIR

# Validate if the input is not empty
if [ -z "$BASE_DIR" ]; then
    echo "Base directory cannot be empty!"
    exit 1
fi

echo "Cleaning up the built derecho and cascade under $BASE_DIR/opt-dev"

rm -rf "$BASE_DIR/opt-dev/include/derecho"
rm -rf "$BASE_DIR/opt-dev/include/cascade"
rm -rf "$BASE_DIR/opt-dev/lib/libderecho*"
rm -rf "$BASE_DIR/opt-dev/lib/libcascade*"
rm -rf "$BASE_DIR/opt-dev/lib/cmake/cascade"
rm -rf "$BASE_DIR/opt-dev/lib/cmake/derecho"
rm -rf "$BASE_DIR/opt-dev/bin/cascade*"
rm -rf "$BASE_DIR/opt-dev/share/derecho"

echo "removed derecho, cascade dependencies"

if [ $# -gt 0 ] && [ "$1" = "py" ]; then
        echo "removed cascade_py packages"
        rm -rf "$BASE_DIR/.local/lib/python3.10/site-packages/derecho"
        rm -rf "$BASE_DIR/.local/lib/python3.10/site-packages/derecho.cascade-1.0rc0.dist-info"
fi
