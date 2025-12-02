# DRL-ZeroDay-Detection

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-red.svg)](https://pytorch.org/)

Official implementation of **"Machine Learning-Based Zero-Day Attack Detection Using Deep Reinforcement Learning"** (Information Security Journal, 2024).

## 🎯 Key Results

| Method | Accuracy | F1-Score | Zero-Day Detection | FP Rate |
|--------|----------|----------|-------------------|---------|
| **PPO (Ours)** | **91.7%** | **89.3%** | **83.4%** | 5.8% |
| DQN | 90.2% | 87.8% | 81.2% | 6.1% |
| A2C | 89.8% | 87.1% | 80.5% | 6.4% |
| XGBoost | 88.4% | 85.6% | 75.3% | 4.2% |
| Deep SVDD | 86.2% | 82.1% | 78.9% | 7.8% |

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/[username]/DRL-ZeroDay-Detection.git
cd DRL-ZeroDay-Detection
pip install -r requirements.txt
```

### Download Datasets

```bash
# See data/README_DATA.md for detailed instructions
python -m src.data_utils.preprocess_cicids2017
```

### Train PPO Model

```bash
# Using config file
python -m src.drl.train_drl --config configs/ppo_cicids2017.yaml

# Or with command line arguments
python -m src.drl.train_drl --model ppo --dataset cicids2017 --lambda_fn 10 --episodes 500
```

### Train Baselines

```bash
python -m src.baselines.train_baselines --dataset cicids2017
```

### Reproduce Paper Results

```bash
python -m experiments.reproduce_tables --all
```

## 📁 Repository Structure

```
DRL-ZeroDay-Detection/
├── configs/                    # Experiment configurations
│   ├── ppo_cicids2017.yaml
│   ├── dqn_cicids2017.yaml
│   └── ...
├── data/
│   ├── README_DATA.md          # Dataset download instructions
│   ├── raw/                    # Downloaded datasets
│   └── splits/                 # Preprocessed train/val/test splits
├── src/
│   ├── drl/                    # DRL implementations
│   │   ├── env_zero_day.py     # Gym environment
│   │   ├── dqn.py              # DQN agent
│   │   ├── ppo.py              # PPO agent
│   │   ├── a2c.py              # A2C agent
│   │   └── train_drl.py        # Training script
│   ├── baselines/              # Baseline methods
│   │   └── train_baselines.py
│   ├── data_utils/             # Preprocessing
│   │   ├── preprocess_cicids2017.py
│   │   └── ...
│   └── evaluation/             # Metrics
│       └── metrics.py
├── experiments/                # Reproduction scripts
│   └── reproduce_tables.py
├── models/                     # Saved models
│   └── pretrained/
├── requirements.txt
└── README.md
```

## 🔬 Method Overview

### Asymmetric Reward Function

Our key contribution is an asymmetric reward function that prioritizes attack detection:

```
R(s, a) = 
    +1   if correct classification
    -1   if false positive (normal → attack)
    -λ   if false negative (attack → normal), λ=10
```

The penalty ratio λ=10 is justified by:
1. **Security criticality**: Missed attacks cost millions in breaches
2. **Class imbalance**: Compensates for attack rarity
3. **Exploration**: Encourages thorough classification of uncertain samples

### Attack-Family-Aware Splitting

To properly evaluate zero-day detection, we ensure test attacks are from *different families* than training:

| Dataset | Training Attacks | Test (Zero-Day) Attacks |
|---------|-----------------|------------------------|
| CICIDS2017 | DoS, DDoS, Port Scan, Brute Force | Web Attacks, Botnet, Infiltration |
| NSL-KDD | DoS, Probe | R2L, U2R |

## 📊 Datasets

| Dataset | Samples | Features | Source |
|---------|---------|----------|--------|
| NSL-KDD | 148,517 | 41 | [UNB](https://www.unb.ca/cic/datasets/nsl.html) |
| CICIDS2017 | 2,830,743 | 78 | [UNB](https://www.unb.ca/cic/datasets/ids-2017.html) |
| CIC-AndMal2017 | 10,854 | 80 | [UNB](https://www.unb.ca/cic/datasets/andmal2017.html) |
| Custom Zero-Day | 350,000 | 65 | This work (included) |

## ⚡ Computational Requirements

| Metric | Value |
|--------|-------|
| Training Time (PPO) | ~4.2 hours |
| Inference Latency | 0.21 ms/sample |
| Throughput | 4,762 samples/s (47K/s batched) |
| GPU Memory | 2.4 GB |
| Model Size | 18.7 MB |

**Hardware used**: NVIDIA RTX 3090, 64GB RAM, Intel i9-12900K

## 📖 Citation

```bibtex
@article{yourname2024zerodaydrl,
  title={Machine Learning-Based Zero-Day Attack Detection Using Deep Reinforcement Learning},
  author={Your Name},
  journal={Information Security Journal},
  year={2024},
  doi={10.xxxx/xxxxx}
}
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📬 Contact

For questions or issues, please open an issue on GitHub or contact [your-email@example.com].
