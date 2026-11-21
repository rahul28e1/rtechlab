import urllib.request
import json
import os

def search_wikimedia(query, limit=5):
    url = f"https://commons.wikimedia.org/w/api.php?action=query&format=json&generator=search&gsrsearch={urllib.parse.quote(query)}&gsrnamespace=6&gsrlimit={limit}&prop=imageinfo&iiprop=url|size|mime"
    req = urllib.request.Request(url, headers={'User-Agent': 'RTechLabEducationalBot/1.0 (contact@rtechlab.in)'})
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            data = json.loads(resp.read().decode('utf-8'))
            pages = data.get('query', {}).get('pages', {})
            results = []
            for pid, pdata in pages.items():
                title = pdata.get('title', '')
                imageinfo = pdata.get('imageinfo', [{}])[0]
                img_url = imageinfo.get('url', '')
                mime = imageinfo.get('mime', '')
                if img_url and ('png' in mime or 'jpeg' in mime or 'jpg' in mime):
                    results.append({'title': title, 'url': img_url, 'mime': mime})
            return results
    except Exception as e:
        print(f"Error querying {query}: {e}")
        return []

queries = [
    'Microsoft Word interface screenshot',
    'Microsoft Excel spreadsheet screenshot',
    'Microsoft PowerPoint presentation screenshot',
    'Microsoft Excel Pivot Table screenshot'
]

for q in queries:
    print(f"=== Results for: {q} ===")
    res = search_wikimedia(q, limit=4)
    for r in res:
        print(f"  {r['title']} -> {r['url']}")
