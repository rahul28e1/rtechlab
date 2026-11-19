# How to Create New RTechLab Digital Notes & Textbooks

Follow the standard 12-phase publishing pipeline to create any new subject notes:

### Step 1: Define Curriculum & Page Budget
Create a syllabus blueprint in `05_RESEARCH_AND_REFERENCES/` with:
- Target page count: 15–40p (Focused Notes), 50–80p (Subject Guides), 100–150+p (Textbooks).
- Clear chapter-wise page allocation.

### Step 2: Authoring in Typst
1. Copy the template from `03_TYPST_DESIGN_SYSTEM/`.
2. Import the master theme:
   ```typst
   #import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *
   #import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/cover-layouts/official-cover.typ": rtech-cover

   #show: rtech-book.with(
     title: "Your Subject Title",
     subtitle: "The Visual Engineering Master Handbook",
     author: "Rahul Sir & RTechLab Team",
     edition: "2027 Industrial Edition",
     subject-code: "RTL-2027-XXX"
   )
   ```
3. Use pre-built components for visual clarity:
   - `#concept-box(title: "...")[]`
   - `#analogy-box(title: "...")[]`
   - `#practical-box(title: "...")[]`
   - `#warning-box(title: "...")[]`
   - `#interview-card(company: "...", role: "...", question: "...", answer: "...")`
   - `#schematic-container(title: "...", figure-id: "FIG X.X", img-path: "...", caption: "...")`
   - `#practice-lab-card(chapter-title: "...", qr-img: "...", practice-url: "...")`

### Step 3: Run the Publishing Engine
Execute the build pipeline:
```bash
python RTECHLAB_AI_PUBLISHING_ENGINE/09_PUBLISHING_ENGINE/build-scripts/publish_book.py
```
This automatically compiles the Typst source, runs 22-point visual QA, extracts the 5-page preview, and updates `public/downloads/`.
