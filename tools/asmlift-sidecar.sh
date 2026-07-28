#!/bin/sh
# Build asmlift's symbol-source ELF: pokeemerald-syms.elf — a VERIFIED COPY of the built ELF.
#
# Unlike other projects in the asmlift benchmark, pokeemerald needs no DWARF types-sidecar:
# the normal build compiles every C file with agbcc's -g, so pokeemerald.elf already embeds
# full DWARF-2 (names, struct layouts, array element sizes — file-scope statics included,
# which a declarations-only sidecar could never carry). This script verifies the DWARF is
# really there and derives the -syms copy; the real build outputs are untouched.
#
# Usage: make asmlift-elf
set -eu

cd "$(dirname "$0")/.."

[ -f pokeemerald.elf ] || { echo "pokeemerald.elf missing — run make first" >&2; exit 1; }

# The section name lives in .shstrtab, so a plain binary grep is enough to verify the
# DWARF made it into the link (no cross binutils needed for a copy step).
if ! LC_ALL=C grep -q '\.debug_info' pokeemerald.elf; then
  echo "pokeemerald.elf carries no .debug_info — expected the agbcc -g DWARF; rebuild" >&2
  exit 1
fi

cp pokeemerald.elf pokeemerald-syms.elf
echo "built pokeemerald-syms.elf"
