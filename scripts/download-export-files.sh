#!/bin/bash

declare -A files=(
    ["lamnings.jsonld"]="https://fornpunkt.se/apis/lamnings?format=jsonld&scope=all"
    ["tags.jsonld"]="https://fornpunkt.se/apis/tags?format=jsonld"
    ["comments.jsonld"]="https://fornpunkt.se/apis/comments?format=jsonld"
    ["wikipedia-annotations.jsonld"]="https://fornpunkt.se/apis/wikipedia-annotations?format=jsonld"
    ["generic-annotations.jsonld"]="https://fornpunkt.se/apis/generic-annotations?format=jsonld"
    ["observation-types.jsonld"]="https://fornpunkt.se/observationstyper.jsonld"
)

for file in "${!files[@]}"; do
    echo "Downloading $file"
    curl -H "Authorization: Token $FP_EXPORT_ACCESS_TOKEN" -o $file ${files[$file]}
done
