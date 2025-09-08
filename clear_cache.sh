#!/bin/bash

# Iterate through all directories in the current directory
for dir in */ ; do
    # Check if the directory contains a .jupyter-cache folder
    if [ -d "$dir/.jupyter_cache" ]; then
        echo "Clearing Jupyter cache in $dir"
        # Navigate into the directory
        (cd "$dir" && jcache project clear -f)
    fi
done

echo "Jupyter cache clearing complete."