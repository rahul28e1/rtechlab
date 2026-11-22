import fitz

doc = fitz.open('test_hl.pdf')
page = doc[0]
pix = page.get_pixmap(dpi=150)
pix.save('test_hl.png')
print('Saved test_hl.png, width:', pix.width, 'height:', pix.height)
