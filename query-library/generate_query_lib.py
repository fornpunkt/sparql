import os
import json

queries = list()
for filename in os.listdir('query-library/src'):
    with open('query-library/src/' + filename, 'r') as f:
        title, tags, body = f.read().split('\n', 2)
        title = title.replace('#title: ', '')
        tags = tags.replace('#tags: ', '').split(',')
        body = body.replace('\n', '', 2)

        query = {}
        query['title'] = title
        query['tags'] = tags
        query['body'] = body
        
        queries.append(query)

with open('editor/queries.json', 'w') as outfile:
    json.dump(queries, outfile)

print('Done generating JSON')