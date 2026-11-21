import os
import subprocess
import fitz

def embed_images():
    eng_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/English'
    hi_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi'

    # Mapping of updates per chapter:
    # (chapter_num, img_path, en_caption, hi_caption, height, target_page_num_in_ch)
    updates = [
        # Chapter 01
        (1, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-365-full-workspace.png",
         "Figure 1.1: Live Microsoft Word 365 Enterprise Interface showing Fluent Ribbon Tabs, Navigation Sidebar & Document Geometry.",
         "चित्र 1.1: माइक्रोसॉफ्ट वर्ड 365 लाइव एंटरप्राइज इंटरफेस — फ्लुएंट रिबन, नेविगेशन साइडबार एवं डॉक्यूमेंट कार्यक्षेत्र।",
         "150pt", 1),
        
        # Chapter 02
        (2, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-ribbon-layout.png",
         "Figure 2.1: Microsoft Word 365 Ribbon Layout Architecture & Contextual Group Command Hierarchy.",
         "चित्र 2.1: माइक्रोसॉफ्ट वर्ड 365 रिबन लेआउट संरचना एवं प्रासंगिक कमांड ग्रुप पदानुक्रम।",
         "115pt", 1),

        # Chapter 09
        (9, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-mailmerge-ui.png",
         "Figure 9.1: Word 365 Mail Merge Automation showing Excel Data Source Integration & Dynamic Field Mapping.",
         "चित्र 9.1: वर्ड 365 मेल मर्ज ऑटोमेशन — एक्सेल डेटा सोर्स इंटीग्रेशन एवं डायनामिक फील्ड मैपिंग।",
         "150pt", 1),

        # Chapter 10
        (10, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-customize-map.png",
         "Figure 10.1: Word 365 Quick Access Toolbar & Ribbon Customization Command Mapping.",
         "चित्र 10.1: वर्ड 365 क्विक एक्सेस टूलबार एवं रिबन कस्टमाइज़ेशन कमांड मैपिंग।",
         "110pt", 1),

        # Chapter 11
        (11, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png",
         "Figure 11.1: Live Microsoft Excel 365 Enterprise Grid showing Structured Table Architecture, Formula Bar & Copilot AI Sidebar.",
         "चित्र 11.1: माइक्रोसॉफ्ट एक्सेल 365 लाइव एंटरप्राइज ग्रिड — स्ट्रक्चर्ड टेबल, फॉर्मूला बार एवं कोपायलट AI साइडबार।",
         "155pt", 1),

        # Chapter 12
        (12, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-ribbon-display.png",
         "Figure 12.1: Microsoft Excel 365 Ribbon Display Options & Formula Bar Telemetry.",
         "चित्र 12.1: माइक्रोसॉफ्ट एक्सेल 365 रिबन डिस्प्ले विकल्प एवं फॉर्मूला बार टेलीमेट्री।",
         "80pt", 1),

        # Chapter 14
        (14, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-vlookup-xlookup-ui.png",
         "Figure 14.1: Excel 365 Modern Lookup Architecture — XLOOKUP Formula Bar, Argument Inspector & Table References.",
         "चित्र 14.1: एक्सेल 365 आधुनिक लुकअप आर्किटेक्चर — XLOOKUP फॉर्मूला बार, आर्गुमेंट इंस्पेक्टर एवं टेबल संदर्भ।",
         "150pt", 1),

        # Chapter 16
        (16, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-conditional-formatting-ui.png",
         "Figure 16.1: Excel 365 Conditional Formatting Rules Manager showing Stop-If-True Priority Logic & Custom Formula Triggers.",
         "चित्र 16.1: एक्सेल 365 कंडीशनल फॉर्मेटिंग रूल्स मैनेजर — स्टॉप-इफ-ट्रू प्राथमिकता लॉजिक एवं कस्टम फॉर्मूला ट्रिगर्स।",
         "145pt", 1),

        # Chapter 21
        (21, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-sample.png",
         "Figure 21.1: Excel PivotTable Analytical Cache Architecture & Dynamic Field List Arrangement.",
         "चित्र 21.1: एक्सेल पिवट टेबल एनालिटिकल कैश संरचना एवं डायनामिक फील्ड लिस्ट व्यवस्था।",
         "140pt", 1),

        # Chapter 23
        (23, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/powerpoint-365-full-workspace.png",
         "Figure 23.1: Live Microsoft PowerPoint 365 Interface showing Slide Sorter Thumbnails, Canvas Alignment & Morph Transition Indicator.",
         "चित्र 23.1: माइक्रोसॉफ्ट पावरपॉइंट 365 लाइव इंटरफेस — स्लाइड सॉर्टर थंबनेल, कैनवास अलाइनमेंट एवं मॉर्फ ट्रांजिशन इंडिकेटर।",
         "155pt", 1),

        # Chapter 24
        (24, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/ppt-slidemaster-ui.png",
         "Figure 24.1: PowerPoint 365 Slide Master View showing Layout Inheritance Tree & Global Placeholder Hierarchy.",
         "चित्र 24.1: पावरपॉइंट 365 स्लाइड मास्टर व्यू — लेआउट इनहेरिटेंस ट्री एवं ग्लोबल प्लेसहोल्डर पदानुक्रम।",
         "145pt", 1),

        # Chapter 26
        (26, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/ppt-morph-transition.png",
         "Figure 26.1: PowerPoint Morph Transition Ribbon Controls & Cinematic Motion Tweening Engine.",
         "चित्र 26.1: पावरपॉइंट मॉर्फ ट्रांजिशन रिबन कंट्रोल्स एवं सिनेमैटिक मोशन ट्वीनिंग इंजन।",
         "130pt", 1),

        # Chapter 29
        (29, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/office-visual-refresh.png",
         "Figure 29.1: Microsoft 365 Modern Unified Visual Refresh across Word, Excel and PowerPoint with Cloud AutoSave & Presence Telemetry.",
         "चित्र 29.1: माइक्रोसॉफ्ट 365 मॉडर्न यूनिफाइड विजुअल रिफ्रेश — वर्ड, एक्सेल एवं पावरपॉइंट में क्लाउड ऑटोसेव व प्रेजेंस टेलीमेट्री।",
         "150pt", 1),

        # Chapter 30
        (30, "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/copilot-office365-ui.png",
         "Figure 30.1: Microsoft 365 Copilot AI Executive Sidebar with Conversational Modeling & Automated Column Generation.",
         "चित्र 30.1: माइक्रोसॉफ्ट 365 कोपायलट AI एग्जीक्यूटिव साइडबार — संवादात्मक मॉडलिंग एवं स्वचालित कॉलम जेनरेशन।",
         "150pt", 1)
    ]

    for ch_num, img_path, en_caption, hi_caption, height, target_page in updates:
        en_file = os.path.join(eng_dir, f"chapter-{ch_num:02d}.typ")
        hi_file = os.path.join(hi_dir, f"chapter-{ch_num:02d}.typ")

        for lang, path, caption in [("English", en_file, en_caption), ("Hindi", hi_file, hi_caption)]:
            if not os.path.exists(path):
                continue
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()

            # Skip if image already inserted
            if os.path.basename(img_path) in content:
                print(f"Skipping {lang} Chapter {ch_num:02d}: already has {os.path.basename(img_path)}")
                continue

            img_snippet = f"""
#v(3pt)
#align(center)[
  #image("{img_path}", width: 95%, height: {height}, fit: "contain")
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    {caption}
  ]
]
"""
            # Insert before the first #pagebreak()
            if "#pagebreak()" in content:
                parts = content.split("#pagebreak()", 1)
                new_content = parts[0] + img_snippet + "\n#pagebreak()" + parts[1]
            else:
                new_content = content + img_snippet

            with open(path, "w", encoding="utf-8") as f:
                f.write(new_content)
            print(f"Updated {lang} Chapter {ch_num:02d} with {os.path.basename(img_path)}")

    print("\nAll chapter files updated with real software UI screenshots!")

if __name__ == "__main__":
    embed_images()
