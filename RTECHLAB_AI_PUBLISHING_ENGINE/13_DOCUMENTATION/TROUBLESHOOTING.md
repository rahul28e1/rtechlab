# RTechLab Publishing Engine Troubleshooting Guide

### 1. Typst Font Warnings
- *Issue*: `warning: unknown font family: inter`
- *Resolution*: Typst cleanly falls back to `Segoe UI` or `Nirmala UI`. To enforce custom fonts, pass `--font-path path/to/fonts/` during compile.

### 2. Path Sandboxing Error
- *Issue*: `error: path ... would escape the project root`
- *Resolution*: Always include `--root .` when invoking `typst compile` from the workspace root directory.

### 3. Hindi Matra or Text Shaping Clipping
- *Issue*: Broken ligatures or conjuncts in Devanagari text.
- *Resolution*: Ensure `lang: "hi"` and `font: ("Nirmala UI", "Segoe UI")` are specified in the `#set text()` block.

### 4. Blank Page Detection
- *Issue*: Extra trailing page in generated PDF.
- *Resolution*: Run `inspect_pdf_pages.py`. PyMuPDF will identify the exact page with low/zero character counts so you can adjust spacing or `#pagebreak()` directives.
