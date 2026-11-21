import os
import urllib.request

def download_assets():
    ui_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui'
    os.makedirs(ui_dir, exist_ok=True)

    urls = {
        'word-365-ribbon.png': 'https://support.content.office.net/en-us/media/e94dcf9c-9c73-45fe-8698-fa93bb383b79.png',
        'word-ribbon-layout.png': 'https://support.microsoft.com/en-us/word/media/word-365-ribbon-description-example.png',
        'office-visual-refresh.png': 'https://support.microsoft.com/en-us/office/media/office-visual-refresh.png',
        'word-customize-map.png': 'https://support.microsoft.com/en-gb/office/media/wd-ribbon-customize-map.png',
        'excel-grid-anatomy.png': 'https://support.content.office.net/en-us/media/64103fa7-876e-4c7b-b3c1-e940ea89b9ec.png',
        'excel-ribbon.png': 'https://support.content.office.net/en-us/media/d9b4b025-450b-466c-94ee-bbd6fa33c7f9.png',
        'powerpoint-workspace.png': 'https://support.content.office.net/en-us/media/9d604e38-f144-482c-b26a-93f54d193d5f.png',
    }

    req_headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}

    for name, url in urls.items():
        dst = os.path.join(ui_dir, name)
        try:
            req = urllib.request.Request(url, headers=req_headers)
            with urllib.request.urlopen(req, timeout=10) as resp, open(dst, 'wb') as f:
                f.write(resp.read())
            print(f"✓ Downloaded {name} ({os.path.getsize(dst)} bytes)")
        except Exception as e:
            print(f"✗ Failed {name}: {e}")

if __name__ == "__main__":
    download_assets()
