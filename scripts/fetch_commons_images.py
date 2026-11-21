import urllib.request
import json
import os

def download_file(url, dst):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'})
    try:
        with urllib.request.urlopen(req, timeout=15) as resp, open(dst, 'wb') as f:
            f.write(resp.read())
        print(f"✓ Saved {dst} ({os.path.getsize(dst)} bytes)")
        return True
    except Exception as e:
        print(f"✗ Failed {dst}: {e}")
        return False

out_dir = "DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui"
os.makedirs(out_dir, exist_ok=True)

# Direct high quality screenshots from Wikimedia Commons & Microsoft
targets = {
    "ms-word-ui.png": "https://upload.wikimedia.org/wikipedia/commons/e/ee/Beckham_MSJH.PNG",
    "excel-grid-sample.png": "https://upload.wikimedia.org/wikipedia/commons/5/58/Screenshot_Excel_RK01.jpg",
    "excel-errors-ui.png": "https://upload.wikimedia.org/wikipedia/commons/7/79/Excel_errors.PNG",
    "excel-binary-ui.png": "https://upload.wikimedia.org/wikipedia/commons/b/b9/Excel_binary_storage.PNG",
}

for name, url in targets.items():
    dst = os.path.join(out_dir, name)
    download_file(url, dst)
