import urllib.request
import re
import os

def download_file(url, filename, access_token):
    headers = {
        "Authorization": f"Token {access_token}",
        "User-Agent": "FornPunkt SPARQL Updater/0.1",
    }
    request = urllib.request.Request(url, headers=headers)

    print(f"Downloading {filename} from {url}")
    with urllib.request.urlopen(request) as response:
        with open(filename, "wb") as f:
            f.write(response.read())

        link_header = response.info().get("Link")
        if link_header:
            next_match = re.search(r'<(.*?)>; rel="next"', link_header)
            if next_match:
                next_url = next_match.group(1)
                print(f"Following next link: {next_url}")
                page_number = re.search(r"page=(\d+)", next_url).group(1)
                new_filename = re.sub(r"-\d+\.jsonld$", f"-{page_number}.jsonld", filename)
                download_file(next_url, new_filename, access_token)

for file in os.listdir("."):
    if file.endswith(".jsonld"):
        os.remove(file)

files = {
    "lamnings.jsonld": "https://fornpunkt.se/apis/export/lamnings?format=jsonld&scope=all",
    "tags.jsonld": "https://fornpunkt.se/apis/export/tags?format=jsonld",
    "comments.jsonld": "https://fornpunkt.se/apis/export/comments?format=jsonld",
    "wikipedia-annotations.jsonld": "https://fornpunkt.se/apis/export/wikipedia-annotations?format=jsonld",
    "generic-annotations-1.jsonld": "https://fornpunkt.se/apis/export/generic-annotations?format=jsonld",
    "observation-types.jsonld": "https://fornpunkt.se/observationstyper.jsonld",
}

for file, url in files.items():
    download_file(url, file, os.environ.get("FP_EXPORT_ACCESS_TOKEN"))
