## About this fork (`asmlift-benchmark` branch)

This branch exists to make the [asmlift](https://github.com/macabeus/asmlift) decompiler
benchmark reproducible. It is the upstream
[pret/pokeemerald](https://github.com/pret/pokeemerald) tree at the exact commit the
benchmark's functions were vendored from, plus a minimal integration commit:

- `decomp.yaml` — points asmlift at the project's symbol source (`tools.asmlift.elf`):
  `pokeemerald-syms.elf`, a verified copy of the built ELF derived by `make asmlift-elf`
  (`tools/asmlift-sidecar.sh`). pokeemerald compiles with agbcc `-g`, so the built ELF
  already embeds full DWARF — struct layouts and array element sizes included; no
  separate types-sidecar is needed
- nothing else differs from upstream

To reproduce the benchmark rows: build the project as usual (the ROM must match), run
`make asmlift-elf`, then follow the per-function scripts published in the benchmark
report.

---

# Pokémon Emerald

This is a decompilation of Pokémon Emerald.

It builds the following ROM:

* [**pokeemerald.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=1961) `sha1: f3ae088181bf583e55daf962a92bb46f4f1d07b7`

To set up the repository, see [INSTALL.md](INSTALL.md).

For contacts and other pret projects, see [pret.github.io](https://pret.github.io/).
