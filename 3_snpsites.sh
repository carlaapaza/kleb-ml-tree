#!/usr/bin/env bash

set -euo pipefail

ALIGN="/home/block/Desktop/ProyectoEcoMol/2_roary_1763401595/core_gene_alignment.aln"
OUTDIR="/home/block/Desktop/ProyectoEcoMol/3_snpsites"
OUT="${OUTDIR}/core_gene_alignment_snps.aln"

mkdir -p "$OUTDIR"

echo "[INFO] Extrayendo SNPs de ${ALIGN}..."
snp-sites -o "$OUT" "$ALIGN"

echo "[INFO] Hecho."
echo "[INFO] Archivo de salida: $OUT"
