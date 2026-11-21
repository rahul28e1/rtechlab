import subprocess
import fitz

def audit():
    doc = fitz.open('DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION/AI-Essentials-English-Edition-1.pdf')
    print(f"Total Pages: {len(doc)}")
    
    underfilled = []
    for i, page in enumerate(doc):
        # Ignore cover (page 0)
        if i == 0:
            continue
        blocks = [
            b for b in page.get_text('blocks') 
            if b[1] > 40 and b[3] < 800 
            and 'OFFICIAL' not in b[4] 
            and 'RTECHLAB' not in b[4] 
            and 'CERTIFIED' not in b[4]
            and 'PUBLICATION' not in b[4]
            and 'Technology Made' not in b[4]
        ]
        if blocks:
            bottom = max(b[3] for b in blocks)
            top = min(b[1] for b in blocks)
            print(f"Page {i+1:02d}: top={top:.1f}, bottom={bottom:.1f} pt")
        else:
            print(f"Page {i+1:02d}: NO BLOCKS")

if __name__ == '__main__':
    audit()
