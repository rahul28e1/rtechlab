with open('src/data/notesCatalog.js', 'r', encoding='utf-8') as f:
    c = f.read()

# 1. Update office365
if "previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf'" not in c:
    c = c.replace(
        "fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',",
        "fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',\n    previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf',\n    fullPdfGu: '/downloads/Office-365-Gujarati-Edition-1.pdf',"
    )

# 2. Update ai
if "previewPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf'" not in c:
    c = c.replace(
        '"fullPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1.pdf",',
        '"fullPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1.pdf",\n      "previewPdfGu": "/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf",\n      "fullPdfGu": "/downloads/AI-Essentials-Gujarati-Edition-1.pdf",'
    )

# 3. Update fundamentals
if "previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf'" not in c:
    c = c.replace(
        "fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',",
        "fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',\n    previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf',\n    fullPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf',"
    )

# 4. Update ccna
if "previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf'" not in c:
    c = c.replace(
        "fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',",
        "fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',\n    previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf',\n    fullPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1.pdf',"
    )

# 5. Update tally (if present)
if "previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf'" not in c:
    c = c.replace(
        "fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',",
        "fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',\n    previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf',\n    fullPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1.pdf',"
    )

with open('src/data/notesCatalog.js', 'w', encoding='utf-8') as f:
    f.write(c)

print('Updated src/data/notesCatalog.js successfully!')
