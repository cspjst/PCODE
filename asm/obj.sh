#!/bin/sh
# obj.sh: assemble one or more .asm files to .obj (no linking).
# usage: obj.sh sys[.asm] [more[.asm] ...]
set -e
[ $# -gt 0 ] || { echo "usage: obj.sh file[.asm] ..." >&2; exit 1; }
for f in "$@"; do
    name=${f%.asm}
    [ -f "$name.asm" ] || { echo "obj.sh: $name.asm not found" >&2; exit 1; }
    wasm -0 -zq -fo="$name.obj" "$name.asm"
    ls -l "$name.obj"
done
