#!/bin/bash

declare -A files=(
    ["lamnings.jsonld"]="https://fornpunkt.se/apis/export/lamnings?format=jsonld&scope=all"
    ["tags.jsonld"]="https://fornpunkt.se/apis/export/tags?format=jsonld"
    ["comments.jsonld"]="https://fornpunkt.se/apis/export/comments?format=jsonld"
    ["wikipedia-annotations.jsonld"]="https://fornpunkt.se/apis/export/wikipedia-annotations?format=jsonld"
    ["generic-annotations-1.jsonld"]="https://fornpunkt.se/apis/export/generic-annotations?format=jsonld"
    ["generic-annotations-2.jsonld"]="https://fornpunkt.se/apis/export/generic-annotations?format=jsonld&page=2"
    ["generic-annotations-3.jsonld"]="https://fornpunkt.se/apis/export/generic-annotations?format=jsonld&page=3"
    ["observation-types.jsonld"]="https://fornpunkt.se/observationstyper.jsonld"
)

for file in "${!files[@]}"; do
    echo "Downloading $file"
    curl -H "Authorization: Token $FP_EXPORT_ACCESS_TOKEN" -o $file ${files[$file]}
done
