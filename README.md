# Machine Learning-Based Zero-Day Attack Detection Using Deep Reinforcement Learning

This repository contains the official implementation of the paper:

> Machine Learning-Based Zero-Day Attack Detection Using Deep Reinforcement Learning

The project implements three Deep Reinforcement Learning (DRL) algorithms—**DQN**, **PPO**, and **A2C**—for zero-day cyber-attack detection, together with classical baselines (SVM, Random Forest, XGBoost, CNN, LSTM).  
The code follows the experimental protocol used in the paper:

- **Attack-family-aware zero-day split** (no train–test leakage)
- Common preprocessing for DRL and baselines
- Scripts to reproduce the **main tables and figures**
- Measurement of **training time** and **inference latency**

---

## Repository structure

```text
src/
  drl/              # DQN, PPO, A2C agents and zero-day MDP environment
  baselines/        # SVM, RF, XGBoost, CNN, LSTM
  data_utils/       # preprocessing + attack-family zero-day splits
  evaluation/       # metrics and table/figure generation
configs/            # YAML configs for each dataset and model
data/               # split CSV files + download instructions (no raw data)
experiments/        # scripts to reproduce Tables 5–8
figures/            # scripts to regenerate paper figures
logs/               # (optional) training / evaluation logs
