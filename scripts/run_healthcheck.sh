#!/usr/bin/env bash
set -euo pipefail

# scripts/run_healthcheck.sh
# Runs SQL + PL/SQL scripts via sqlplus and saves a timestamped report.
#
# Usage:
#   ./scripts/run_healthcheck.sh user/pass@host:1521/service
#
# Requirements:
#   - Oracle client installed
#   - sqlplus available in PATH

CONN="${1:-}"

if [[ -z "$CONN" ]]; then
  echo "Usage: $0 user/pass@host:1521/service"
  exit 1
fi

OUT_DIR="reports"
mkdir -p "$OUT_DIR"
TS="$(date +%Y%m%d_%H%M%S)"
REPORT="$OUT_DIR/healthcheck_${TS}.txt"

echo "Running healthcheck -> $REPORT"

sqlplus -s "$CONN" @sql/healthcheck.sql > "$REPORT"
sqlplus -s "$CONN" @plsql/generate_report.sql >> "$REPORT"

echo "Done."
echo "Report saved: $REPORT"
