# Reproducible Pipeline: Clonal Background and Plasmid Transmission in *Klebsiella pneumoniae*
**Replication of:**  
Ikhimiukor OO, Zac Soligno NI, Akintayo IJ, Marcovici MM, Souza SSR, Workman A, Martin IW, Andam CP. (2024).  
*Clonal background and routes of plasmid transmission underlie antimicrobial resistance features of bloodstream Klebsiella pneumoniae.*  
**Nature Communications, 15(1), 6969.**

---

## Overview

This repository provides a **fully reproducible bioinformatics pipeline** replicating the analyses from Ikhimiukor et al. (2024), who investigated how **clonal background** and **plasmid transmission routes** shape antimicrobial resistance (AMR) patterns in *Klebsiella pneumoniae* bloodstream isolates.

The pipeline integrates short- and long-read data processing, hybrid assembly, plasmid identification, pangenome reconstruction, phylogenetics, and AMR gene profiling.  
All steps follow the logic and methods described in the original paper, with additional annotations to promote transparency and reproducibility.

---

## Repository Structure
├── data/                # Raw data or links to download them
├── envs/                # Conda environment files (YAML)
├── scripts/             # Bash, Python, and R scripts
├── results/             # Output folders (assemblies, trees, figures…)
└── docs/                # Notes, methods, diagrams
