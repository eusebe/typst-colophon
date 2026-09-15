#!/bin/bash
# Regenerates every PDF and PNG the manual (docs/manual.typ, once it
# exists, and the site's colophon/*/index.typ pages today) embeds from
# these snippets. Each snippet is a real, self-contained file compiled
# for real via the bundle export --- nothing here is simulated.
#
# Run from anywhere; --root is the ecosystem directory (the parent of
# typst-colophon), matching every cross-package absolute path
# (/typst-palimpsest/..., /typst-checkitoff/..., /combo-test-consort-palimpsest/...)
# these snippets use, the same convention typst-colophon/tests/ itself
# relies on.
set -e
cd "$(dirname "$0")"

# project-example/ is the exception: its screenshot is a real page from
# ../../examples/fridge-study/main/audit.pdf, copied rather than
# compiled here, since that example already exercises a real journal
# template end to end --- see examples/fridge-study/main.typ itself for
# the source this one screenshot comes from.

for f in *.typ; do
    name="${f%.typ}"
    echo "compiling $name..."
    typst compile --root ../../.. --features bundle --format bundle "$f"
done

rasterize() {
    local pdf="$1" out="$2" pages
    pages=$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')
    if [ "$pages" = "1" ]; then
        pdftoppm -png -r 150 -f 1 -l 1 "$pdf" /tmp/colophon-shot
        mv /tmp/colophon-shot-1.png "$out.png" 2>/dev/null || mv /tmp/colophon-shot.png "$out.png"
        magick "$out.png" -bordercolor white -border 20 -trim +repage -bordercolor white -border 20 "$out.png"
    else
        for ((p = 1; p <= pages; p++)); do
            pdftoppm -png -r 150 -f "$p" -l "$p" "$pdf" /tmp/colophon-shot
            mv /tmp/colophon-shot-"$p".png "$out-$p.png" 2>/dev/null || mv /tmp/colophon-shot.png "$out-$p.png"
            magick "$out-$p.png" -bordercolor white -border 20 -trim +repage -bordercolor white -border 20 "$out-$p.png"
        done
    fi
}

for dir in */; do
    dir="${dir%/}"
    for pdf in "$dir"/*.pdf; do
        [ -e "$pdf" ] || continue
        base=$(basename "$pdf" .pdf)
        rasterize "$pdf" "$dir/$base-plain"
    done
done

echo done
