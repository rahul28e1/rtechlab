# RTechLab AI Digital Publishing Engine — Setup & Environment Guide

## 1. Prerequisites Verified on System
- **Operating System**: Windows 11 64-bit
- **Typst Compiler**: `Typst 0.15.1` (Globally active via `typst`)
- **Quarto CLI**: `Quarto 1.11.9` (Globally active via `quarto`)
- **Python Runtime**: Python 3.13 (with `pypdf`, `pymupdf` (fitz), `qrcode[pil]`, `matplotlib`, `pillow`)
- **Node.js**: Node 20+

## 2. Directory Structure Overview
```
RTECHLAB_AI_PUBLISHING_ENGINE/
├── 00_MASTER_CONFIG/               # Brand, design, and research policies
├── 01_AGENT_SKILLS/                # Permanent Antigravity publishing skill
├── 02_QUARTO_TEMPLATES/            # Quarto book project templates
├── 03_TYPST_DESIGN_SYSTEM/         # Master Typst themes, covers, callout boxes
├── 04_VISUAL_ASSET_ENGINE/         # 300 DPI vector schematics and diagram assets
├── 05_RESEARCH_AND_REFERENCES/     # Fact-checking and source claims registers
├── 06_CONTENT_SCHEMA/              # JSON schemas for books, chapters, MCQs, QRs
├── 07_INTERACTIVE_PRACTICE_ENGINE/ # Web MCQ practice application & question banks
├── 08_QR_CODE_SYSTEM/              # Level-H QR generator, register, and URL maps
├── 09_PUBLISHING_ENGINE/           # Compilation, QA, and validation scripts
├── 10_SAMPLE_BOOK/                 # Bilingual source manuscripts and rendered PDFs
├── 11_FINAL_PRODUCTS/              # Master PDFs, free previews, carousel assets
├── 12_QUALITY_ASSURANCE/           # Page-by-page visual inspection reports & images
└── 13_DOCUMENTATION/               # Operations, authoring, and troubleshooting manuals
```

## 3. Quick Verification
To verify your environment anytime:
```bash
typst --version
quarto --version
python -c "import fitz, qrcode, pypdf; print('All publishing libraries verified!')"
```
