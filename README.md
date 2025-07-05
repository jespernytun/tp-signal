# tp-signal# Fourier Analysis Projects (MATLAB / Octave)

This repository contains two small projects developed for coursework in signal processing, focusing on Fourier series decomposition, calculation of coefficients, signal reconstruction, and average power estimation.  
All scripts were written in MATLAB / GNU Octave and are fully reproducible.

---

## Overview

### Project 1: Fourier Coefficients Calculation (`TP1_1.m`)

This script computes the complex Fourier series coefficients of a user-defined periodic signal. It also plots the input signal over one period.

Main features:
- Numerically integrates to compute the constant term (A₀) and the complex coefficients (Cₙ).
- Uses a discrete approximation (Riemann sum) over the sampled period.
- Allows for easy modification of the signal definition and parameters such as amplitude, period, and number of coefficients.
- Outputs:
  - A plot of the input signal over one period.
  - A printed list of A₀ and the complex coefficients Cₙ.

Key parameters (can be edited directly in the script):
- `E`: Amplitude of the signal.
- `T0`: Period of the signal.
- `Tau`: Width of a rectangular pulse (if used in the signal).
- `N`: Number of Fourier coefficients to compute.
- `s3`: Definition of the user’s signal (can be sinusoidal, rectangular, or any function).

---

### Project 2: Average Power Calculation and Fourier Reconstruction (`TP1_2.m`)

This script calculates the average power of a periodic signal using direct integration. It then computes the real Fourier series coefficients (a₀, aₙ, bₙ), reconstructs the signal using these coefficients up to a selected number of harmonics, and examines how the reconstructed signal’s average power approaches the original power as the number of harmonics increases.

Main features:
- Calculates the original signal’s average power using numerical integration.
- Computes the Fourier series coefficients (a₀, aₙ, bₙ) up to `N_max` harmonics.
- Reconstructs the signal for increasing numbers of harmonics to visualize convergence.
- Plots:
  - The original signal versus the reconstructed signal using `N_max` harmonics.
  - The evolution of the reconstructed signal’s average power as a function of the number of harmonics, compared to the original power.

Key parameters (modifiable at the top of the script):
- `E`: Amplitude of the signal.
- `T0`: Period of the signal.
- `Tau`: Width of the pulse (if applicable).
- `N_max`: Maximum number of harmonics used for reconstruction.
- `s3`: The user-defined input signal.

---

## Usage

1. Make sure you have either MATLAB or GNU Octave installed.

2. Run the desired script from the terminal or MATLAB/Octave console:

For the complex Fourier coefficients calculation:
```bash
octave NYTUN_TRONES_Gpe_C_TP1_1.m
```
```bash
octave NYTUN_TRONES_Gpe_C_TP1_2.m
