# How to Update and Validate QR Codes

### Switching from Development to Production Domain:
When the official RTechLab domain is purchased and active:
1. Open `RTECHLAB_AI_PUBLISHING_ENGINE/08_QR_CODE_SYSTEM/qr-generator/qr_generator.py`.
2. Update `DEFAULT_BASE_URL` to `"https://rtechlab.in"`.
3. Re-run:
   ```bash
   python RTECHLAB_AI_PUBLISHING_ENGINE/08_QR_CODE_SYSTEM/qr-generator/qr_generator.py
   ```
4. Re-compile books using `publish_book.py`. All QR codes across all PDFs will point to production URLs with zero manual editing!

### Error Correction Mandate:
All QR codes MUST use **Level H** error correction (30% damage recovery) to ensure 100% scan reliability even on low-light phone cameras or creased paper printouts.
