---
name: rtechlab-digital-publishing
description: Creates original, research-verified, illustrated, bilingual educational books, professional PDFs, topic-wise MCQ banks, QR-linked practice pages and RTechLab commercial learning products.
---

# RTechLab Digital Publishing Engine — Master Agent Skill

## 1. Overview & Purpose
This skill encapsulates the end-to-end publishing pipeline for **RTechLab**, enabling the generation of world-class, commercial-grade digital technical textbooks, focused notes, interactive web practice quizzes, and QR-linked learning ecosystems in both English and Hindi.

It bridges modern typesetting (**Typst** and **Quarto**) with research verification, vector schematic illustration, bilingual pedagogical structuring, and interactive website testing.

## 2. Brand Identity & Visual Rules
- **Brand Name**: RTechLab
- **Tagline**: Learn. Practice. Innovate. | Technology Made Practical.
- **Author Line**: Rahul Sir & RTechLab Engineering Directorate.
- **Palette**:
  - Deep Navy: `#192446`
  - Electric Cyan: `#25B6F9`
  - Deep Violet: `#7A25CA`
  - Light Academic Paper: `#FDFDFE` (Primary background for reading comfort)
  - Dark Slate Text: `#202B4D` (High contrast body text)
- **Logos & Watermarks**:
  - Transparent Master Logo: `/public/brand/rtechlab-logo-transparent.png`
  - Header Logo: `/public/brand/rtechlab-header-logo.png`
  - Anti-Piracy Watermark: `/public/brand/rtechlab-watermark.png` (3.5%–4.5% opacity, -25° diagonal tilt on every page)
  - Circuit Icon: `/public/logo-icon.svg`

## 3. The 12-Phase Publishing Pipeline
1. **Phase A — Subject Selection**: Define target domain, student audience, prerequisites, and scope.
2. **Phase B — Curriculum Architecture**: Build modular chapter index with page allocation targets (15–40p notes, 50–80p guides, 100–150+p textbooks).
3. **Phase C — Research & Fact-Checking**: Verify all technical statements against official RFCs, vendor manuals, and standards. Record in `source-register.json`.
4. **Phase D — Content Authoring (Bilingual)**: Create parallel English (`_EN`) and Hindi (`_HI`) manuscripts. Hindi preserves standard English technical terms (commands, protocols, registers).
5. **Phase E — Visual Asset Generation**: Generate 300 DPI vector schematics (SVG), system flowcharts, and genuine terminal output captures.
6. **Phase F — Chapter MCQ Banks**: Develop tiered question banks (10 Basic, 10 Intermediate, 5 Advanced) with detailed explanations for correct answers and distractors.
7. **Phase G — Interactive Practice Pages**: Wire questions into the website MCQ practice engine routes (`/practice/<subject>/<topic>`).
8. **Phase H — QR Code System**: Generate chapter-specific SVG QR codes with high error correction and print-safe quiet zones.
9. **Phase I — Typst Typesetting**: Compile through `master-theme.typ` with strict A4 dimensions, running headers, footers, and callout boxes.
10. **Phase J — PDF Export**: Render final vector PDF and extract 5-page free preview.
11. **Phase K — 22-Point Visual QA**: Inspect every single page for blank page spillover, font embedding, Hindi shaping, image sharpness, and QR readability.
12. **Phase L — Commercial Packaging**: Package into ₹49 single pass, ₹149 career accelerator, or ₹249 duo combo bundles.

## 4. Reusable Commands & Helper Scripts
- **Compile Typst Document**:
  ```bash
  typst compile input.typ output.pdf
  ```
- **Generate Chapter QR Code**:
  ```bash
  python RTECHLAB_AI_PUBLISHING_ENGINE/09_PUBLISHING_ENGINE/build-scripts/generate_qr.py --topic <topic-id> --url <url>
  ```
- **Run Visual PDF Inspection (Render Pages to PNG)**:
  ```bash
  python RTECHLAB_AI_PUBLISHING_ENGINE/09_PUBLISHING_ENGINE/pdf-validation/inspect_pdf_pages.py --pdf <file.pdf>
  ```
- **Validate MCQ Question Bank**:
  ```bash
  python RTECHLAB_AI_PUBLISHING_ENGINE/09_PUBLISHING_ENGINE/pdf-validation/validate_mcq_bank.py --json <mcqs.json>
  ```

## 5. Directory Structure Reference
The publishing engine lives in `RTECHLAB_AI_PUBLISHING_ENGINE/` and connects to the main website without mutating production routes or existing video production pipelines.
