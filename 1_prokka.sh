#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR="/home/block/Desktop/ProyectoEcoMol/0_sequences"
OUT_BASE="/home/block/Desktop/ProyectoEcoMol/1_prokka"
THREADS=30

msg() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

msg "[INFO] Iniciando anotación con Prokka..."
mkdir -p "${OUT_BASE}"

prokka --version

for fasta in "${INPUT_DIR}"/*.{fasta,fa,fna}; do

  [[ -e "$fasta" ]] || continue

  base=$(basename "${fasta}")
  sample="${base%%.*}"

  outdir="${OUT_BASE}/${sample}"
  msg "[RUN] Anotando ${sample} ..."
  
  prokka \
    --outdir "${outdir}" \
    --prefix "${sample}" \
    --force \
    --cpus "${THREADS}" \
    --compliant \
    --addgenes \
    --rfam \
    --genus Klebsiella \
    --species pneumoniae \
    "${fasta}"

  msg "[DONE] ${sample} anotado en ${outdir}"
done

msg "[INFO] Todas las anotaciones completadas."
