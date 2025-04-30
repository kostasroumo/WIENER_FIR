# 🎧 DIGITAL SIGNAL PROCESSING

## 🔧 Denoising with Wiener FIR Filter

---

This project implements **Wiener filtering techniques** for signal denoising in MATLAB, using both full-signal and frame-based methods. It also includes prediction and noise estimation strategies for cases where the clean reference signal is not available.

---

## 🧠 Overview

This work was developed as part of a diploma thesis on **Explainable Artificial Intelligence (XAI)** and **Digital Signal Processing (DSP)** at **Democritus University of Thrace**, supervised by Prof. I. Pratikakis.

The project focuses on:
- Noise addition and signal visualization
- Wiener filtering with known and estimated signal statistics
- Frame-based adaptive filtering
- Signal-to-Noise Ratio (SNR) evaluation
- Prediction of future signal values using Wiener methods

---

## 📂 Files Included

| File | Description |
|------|-------------|
| `my_wiener.m` | Basic Wiener filter using the clean reference signal |
| `wienerframes.m` | Frame-based Wiener filtering |
| `neWiener.m` | Wiener filtering without reference signal (estimates noise stats) |
| `frame_wind.m` | Frames signal into overlapping windows |
| `frame_recon.m` | Reconstructs signal from windowed frames |
| `find_silence.m` | Detects silent (noise-only) segments in the signal |
| `neWiener_frames.m` | Frame-based filtering without clean reference |
| `wiener_predict.m` | Predicts future samples using Wiener filtering |
| `wiener_predict_frames.m` | Frame-based prediction of future values |

---

## 🚀 How to Run

Run the main execution file:

```matlab
MAIN.m
