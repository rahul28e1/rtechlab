import os
import re

def update_file(filepath, label_text, is_en=False, is_gu=False):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Pattern to find the grid containing rahulprofile28, youtube, instagram
    pattern = r'(#link\("https://rahulprofile28\.netlify\.app/"\)\[[\s\S]*?#box\([\s\S]*?\][\s\S]*?\][\s\S]*?#link\("https://www\.youtube\.com/@RTechLabOfficial"\)\[[\s\S]*?#box\([\s\S]*?\][\s\S]*?\][\s\S]*?#link\("https://www\.instagram\.com/rtechlabofficial/"\)\[[\s\S]*?#box\([\s\S]*?\][\s\S]*?\])'
    
    match = re.search(pattern, content)
    if not match:
        print(f"Could not find link block in {filepath}")
        return False

    old_block = match.group(1)
    
    new_block = f'''#link("https://rahulprofile28.netlify.app/")[
              #box(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BFDBFE"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_website.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rtech-blue)[{label_text}]
                )
              ]
            ]
          ],
          [
            #link("https://www.youtube.com/@RTechLabOfficial")[
              #box(fill: rgb("#FEF2F2"), stroke: 0.5pt + rgb("#FECACA"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_youtube.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rgb("#DC2626"))[\\@RTechLabOfficial]
                )
              ]
            ]
          ],
          [
            #link("https://www.instagram.com/rtechlabofficial/")[
              #box(fill: rgb("#FDF2F8"), stroke: 0.5pt + rgb("#FBCFE8"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_instagram.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rgb("#DB2777"))[\\@rtechlabofficial]
                )
              ]
            ]'''

    new_content = content.replace(old_block, new_block)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Updated {filepath} successfully!")
    return True

if __name__ == '__main__':
    update_file('scripts/build_tally_hindi_v2.py', 'पोर्टफोलियो साइट')
    update_file('scripts/build_tally_english_v2.py', 'Portfolio Website', is_en=True)
    update_file('scripts/build_tally_gujarati_v2.py', 'પોર્ટફોલિયો સાઇટ', is_gu=True)
