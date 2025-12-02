#!/bin/bash
# Script to create the complete repository structure
# Run this in your repository root

# Create directory structure
mkdir -p data/raw data/splits/nsl_kdd data/splits/cicids2017 data/splits/cicandmal2017 data/splits/custom_zd
mkdir -p src/drl src/baselines src/data_utils src/evaluation
mkdir -p configs
mkdir -p experiments
mkdir -p figures
mkdir -p models/pretrained
mkdir -p logs

echo "Directory structure created!"
