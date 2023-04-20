# FornPunkt SPARQL

This repository contains various resources related to FornPunkt's SPARQL service, such as editor configuration, the public query library, Graph Store HTTP Protocol utilities, and Caddy server configuration.

## Setup your editor

### Prerequisites

 - Fuseki running on `localhost:3030` using the `config.ttl` configuration
 - Caddy installed

### Setup

1. Clone this repository
2. Update `Caddyfile` with your domain or IP address
2. Run `caddy` from the root directory
3. Done!

Optionally if you want to pull data directly for FornPunkt's Export API you should also set the `FP_EXPORT_ACCESS_TOKEN` environment variable to an access token with read rights.

## Getting RDF

FornPunkts RDF can be retrieved by sending an HTTP request with an `Accept: application/ld+json` header to any RDF capable URL on fornpunkt.se or by signing into FornPunkt and using the "Export" tool. <a href="https://fornpunkt.se/data/fornpunkt-json-ld-api">See the API documentation for more information.</a>

## Graph Store HTTP Protocol utilities

The `scripts` folder contains several Shell scripts for working with the Graph Store HTTP Protocol and FornPunkt's Export API. The scripts only dependencies are `curl` and Bash 4+.

## Adding queries to the library

Add a new file to the `query-library/src` directory and format your file as shown below. Both a title and tags are mandatory:

```
#title: List sites with a given title
#tags: sites


PREFIX schema: <http://schema.org/>

SELECT * WHERE {
  ?site a schema:CreativeWork ;
        schema:name 'Stensättning'@sv .
}

```

You can generate a query library JSON file by running the following from the root directory:

```
python query-library/generate_query_lib.py
```
