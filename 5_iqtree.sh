#!/usr/bin/env bash
set -euo pipefail

# === Entradas / parámetros ===
SNP_ALN=${SNP_ALN:-/home/block/Desktop/ProyectoEcoMol/3_snpsites/core_gene_alignment_snps.aln}
OUTDIR=${OUTDIR:-/home/block/Desktop/ProyectoEcoMol/5_iqtree_selected_strains}
PREFIX=${PREFIX:-iqtree_core_snps_final}

# Modelo: R4 suele ser suficiente y más rápido que R7; mantenemos ASC (SNP-only)
MODEL=GTR+F+ASC+R7

# Soportes: 1000/1000 + -bnni (reduce sobreestimación de UFBoot y converge antes)
BOOT=${BOOT:-1000}
ALRT=${ALRT:-1000}

# Hilos: usa todos los físicos disponibles salvo que se especifique THREADS
THREADS=5
SEED=${SEED:-123}

IQTREE=/home/block/Desktop/ProyectoEcoMol/scripts/tools/iqtree-2.4.0-Linux-intel/bin/iqtree2

mkdir -p "${OUTDIR}"
cd "${OUTDIR}"

echo "[INFO] Ejecutando IQ-TREE2 con modelo ${MODEL}"
echo "[INFO] Soportes: UFBoot=${BOOT} (con -bnni), SH-aLRT=${ALRT}, Threads=${THREADS}"
echo "[INFO] Prefix: ${PREFIX}"
echo "[INFO] Reanudación: IQ-TREE detectará automáticamente ${PREFIX}.ckp.gz si existe."

# NOTA: IQ-TREE reanuda automáticamente si encuentra ${PREFIX}.ckp.gz con el mismo -pre.
# No uses -redo si quieres reanudar; -redo fuerza a ignorar el checkpoint.
"${IQTREE}" \
  -s "${SNP_ALN}" \
  -m "${MODEL}" \
  -B "${BOOT}" -bnni \
  -alrt "${ALRT}" \
  -T "${THREADS}" \
  -seed "${SEED}" \
  -pre "${PREFIX}"

echo "[INFO] Listo."
echo "Archivos principales:"
echo "  • ${OUTDIR}/${PREFIX}.treefile   → Árbol ML final"
echo "  • ${OUTDIR}/${PREFIX}.contree    → Árbol con soportes (aparece al finalizar)"
echo "  • ${OUTDIR}/${PREFIX}.iqtree     → Resumen del modelo/soportes"
echo "  • ${OUTDIR}/${PREFIX}.ufboot     → Réplicas UFBoot"
echo "  • ${OUTDIR}/${PREFIX}.alrt       → SH-aLRT"
echo "  • ${OUTDIR}/${PREFIX}.ckp.gz     → Checkpoint (para reanudar)"
