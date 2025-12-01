#!/usr/bin/env bash
set -euo pipefail

GFF_DIR="/home/block/Desktop/ProyectoEcoMol/1_prokka"
OUT_DIR="/home/block/Desktop/ProyectoEcoMol/2_roary"
THREADS=30
CORE_PCT=99

export LC_ALL=C.UTF-8 LANG=C.UTF-8
export TMPDIR="${TMPDIR:-/home/block/Desktop/ProyectoEcoMol/tmp_roary}"
mkdir -p "$OUT_DIR" "$TMPDIR"

msg(){ echo "[$(date '+%F %T')] $*"; }

mapfile -t GFFS < <(find "$GFF_DIR" -type f -name "*.gff" | sort)
msg "[INFO] Se encontraron ${#GFFS[@]} archivos GFF."

msg "[INFO] Iniciando Roary (THREADS=$THREADS, CORE=$CORE_PCT, TMPDIR=$TMPDIR)…"
roary -e -n -p "$THREADS" -cd "$CORE_PCT" -z -v \
  -f "$OUT_DIR" "${GFFS[@]}" \
  > "$OUT_DIR/roary.log" 2>&1

msg "[DONE] Roary completado. Resultados en: $OUT_DIR"
