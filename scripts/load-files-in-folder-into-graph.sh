for file in *; do 
    if [ -f "$file" ]; then 
        echo "Loading $file into graph" 
        # load json-ld file into graph
        curl --include -X POST -H "Content-Type: application/ld+json" -d @$file http://127.0.0.1:3030/fornpunkt?default ;
    fi
done
