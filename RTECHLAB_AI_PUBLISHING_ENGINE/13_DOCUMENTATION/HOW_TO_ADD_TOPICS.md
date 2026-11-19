# How to Add New Topics to the Publishing Engine

To expand the RTechLab catalog across the 8 core disciplines:
1. **Computer Fundamentals** (100+ Pages)
2. **Computer Hardware & Architecture** (130+ Pages)
3. **Computer Networking Fundamentals** (160+ Pages)
4. **CCNA Enterprise — Top Tier Notes** (210+ Pages)
5. **AWS Cloud Solutions Architect** (190+ Pages)
6. **Microsoft Azure Infrastructure** (175+ Pages)
7. **Cyber Security (Defensive/SOC)** (160+ Pages)
8. **Ethical Hacking (Offensive/Pentesting)** (195+ Pages)

### Topic Setup Checklist:
1. Register topic in `08_QR_CODE_SYSTEM/destination-map/chapter-practice-map.json`.
2. Generate chapter-unique QR codes using `qr_generator.py`.
3. Add corresponding MCQs to `07_INTERACTIVE_PRACTICE_ENGINE/question-bank/`.
4. Create 300 DPI vector schematics in `public/images/notes/`.
5. Write the Typst manuscript with verified RFC and vendor citations.
