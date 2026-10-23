#!/bin/sh
# com: assemble wasm and link wlink a DOS .COM.   usage: com hello   (or hello.asm)
set -e
name=${1%.asm}
[ -n "$name" ] || { echo "usage: com file[.asm]" >&2; exit 1; }
[ -f "$name.asm" ] || { echo "com: $name.asm not found" >&2; exit 1; }
wasm -0 -zq -fo="$name.obj" "$name.asm"
wlink format dos com name "$name.com" file "$name.obj" option quiet
ls -l "$name.com"
