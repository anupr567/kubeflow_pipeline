#!/bin/bash -e

cd ./components
for component_dir in $(ls -d */ | sed 's%/%%g'); do       # going into each component directory
  cd $component_dir
  echo "Building Docker container in $component_dir"
  bash ../../build_container.sh
  cd ..
done
