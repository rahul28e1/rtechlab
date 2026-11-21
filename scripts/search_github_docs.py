import urllib.request
import json

url = "https://api.github.com/search/code?q=extension:png+repo:MicrosoftDocs/microsoft-365-docs+path:media"
req = urllib.request.Request(url, headers={'User-Agent': 'RTechLabEducationalBot/1.0'})
try:
    with urllib.request.urlopen(req, timeout=10) as resp:
        data = json.loads(resp.read().decode('utf-8'))
        print("Total count:", data.get('total_count', 0))
        for item in data.get('items', [])[:10]:
            print(item['name'], item['html_url'])
except Exception as e:
    print("Error:", e)
