import os
import urllib.request

def download_more_assets():
    ui_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui'
    os.makedirs(ui_dir, exist_ok=True)

    urls = {
        'excel-pivottable-create.png': 'https://support.microsoft.com/en-us/excel/media/pivottable-from-range-or-table.png',
        'excel-pivottable-tabular.jpg': 'https://support.microsoft.com/en-us/excel/media/pivottabletabularform.jpg',
        'excel-pivottable-sample.png': 'https://support.microsoft.com/en-gb/excel/media/excel-pivottable-sampledata.png',
        'excel-ribbon-display.png': 'https://support.microsoft.com/en-us/excel/media/ribbon-display-options-in-excel.png',
        'ppt-morph-transition.png': 'https://support.microsoft.com/en-us/powerpoint/media/ppt16-morph.png',
        'ppt-morph-rotate.png': 'https://support.microsoft.com/en-us/powerpoint/media/morph-arrange-rotate.png',
    }

    req_headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}

    for name, url in urls.items():
        dst = os.path.join(ui_dir, name)
        try:
            req = urllib.request.Request(url, headers=req_headers)
            with urllib.request.urlopen(req, timeout=12) as resp, open(dst, 'wb') as f:
                f.write(resp.read())
            print(f"✓ Downloaded {name} ({os.path.getsize(dst)} bytes)")
        except Exception as e:
            print(f"✗ Failed {name}: {e}")

if __name__ == "__main__":
    download_more_assets()
