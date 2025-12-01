#!/usr/bin/env bash

# Corre ModelFinder (IQ-TREE2) sobre un alineamiento de SNPs

set -euo pipefail

SNP_ALN=/home/block/Desktop/ProyectoEcoMol/3_snpsites/core_gene_alignment_snps.aln
OUTDIR=/home/block/Desktop/ProyectoEcoMol/4_modeltest
PREFIX=modeltest_snp
THREADS=8
SEED=123

mkdir -p "${OUTDIR}"
cd "${OUTDIR}"

echo "[INFO] Ejecutando ModelFinder en IQ-TREE2 (MFP+ASC para matrices de SNPs)"
/home/block/Desktop/ProyectoEcoMol/scripts/tools/iqtree-2.4.0-Linux-intel/bin/iqtree2 \
  -s "${SNP_ALN}" \
  -m MFP+ASC \
  -T "${THREADS}" \
  -seed "${SEED}" \
  -pre "${PREFIX}"

echo "[INFO] Listo."
echo "[INFO] Resultados principales:"
echo "  → Archivo resumen: ${OUTDIR}/${PREFIX}.iqtree"
echo "  → Árbol ML preliminar: ${OUTDIR}/${PREFIX}.treefile"
echo
echo "[INFO] El mejor modelo se encuentra en la línea que dice 'Best-fit model according to BIC:'"
echo "Ejemplo:"
echo "  Best-fit model according to BIC: GTR+F+ASC+G4"
