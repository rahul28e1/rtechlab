# RTechLab Typst & Typesetting Design System

## 1. Page Geometry (A4 Standard)
- **Dimensions**: 210mm x 297mm (A4 Portrait).
- **Margins**: Top: 20mm, Bottom: 20mm, Inside: 18mm, Outside: 18mm.
- **Grid**: Strict modular 12-column baseline grid.

## 2. Typography Hierarchy
- **English Font**: Inter, Noto Sans, or verified clean sans-serif.
- **Hindi Font**: Noto Sans Devanagari.
- **Code & Command Font**: JetBrains Mono, Fira Code, or Roboto Mono.
- **Scale**:
  - Book Title: 32pt Bold
  - Chapter Title: 24pt Bold
  - Section (H1): 18pt Bold
  - Subsection (H2): 14pt SemiBold
  - Topic Header (H3): 12pt SemiBold
  - Body Text: 10pt Regular (Line height: 1.45em)
  - Captions & Notes: 8.5pt Regular
  - Code Spans: 8.5pt Monospace

## 3. Component Architecture
- **Universal Running Header**: Shows RTechLab circuit logo, Subject Title, Chapter Name, and Edition.
- **Universal Running Footer**: Shows "Technology Made Practical · rtechlab.in", Author Credit, and "Page X of Y".
- **Callout Containers**:
  - `concept-box()`: Cyan border, light tint (`#25B6F90A`), explains theoretical principles.
  - `analogy-box()`: Violet border, light tint (`#7A25CA0A`), real-world physical analogies.
  - `practical-box()`: Emerald border, light tint (`#10B9810A`), step-by-step CLI commands and lab outputs.
  - `warning-box()`: Amber border, light tint (`#F59E0B0A`), common student traps & field mistakes.
  - `interview-box()`: Navy border, light tint (`#1924460A`), tier-1 MNC screening questions.
