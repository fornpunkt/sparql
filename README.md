# FornPunkt SPARQL

This repository contains various resources related to FornPunkt's SPARQL service, such as editor configuration and the public query library.

## Setup your editor

The query library and editor configuration is made for the Thor SPARQL editor and visualization interface. You can install the FornPunkt configuration by copying all files found in the `editor` directory into Thor's `config` directory.

## Getting RDF

FornPunkts RDF can be retrived by sending a HTTP request with a `Accept: application/ld+json` header to any RDF capable URL on fornpunkt.se or by signing into FornPunkt and using the "Export" tool.

## Adding queries to the library

Add a new file to the `query-library/src` directory and format your file as show below. Both a title and tags are mandatory:

```
#title: List sites with a given title
#tags: sites

PREFIX schema: <http://schema.org/>

SELECT * WHERE {
  ?site a schema:CreativeWork ;
        schema:name 'Stensättning'@sv .
}

```

You can generate query library JSON file by running the following from the root directory:

```
python query-library/generate_query_lib.py
```
