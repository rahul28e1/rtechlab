"""
RTechLab CCNA 200-301 Master Publishing Suite Generator
Generates:
1. Cover & Blueprint (English & Hindi)
2. 10 Comprehensive Chapters (English & Hindi) matching exact 45-page layout
3. Main compilation documents (English & Hindi)
4. Lab Workbook, Interview Vault & Career Blueprint
5. Compiles all PDFs via Typst
6. Extracts 5-page previews via PyPDF
7. Creates Complete Career Bundle ZIP
8. Copies outputs to public/downloads/
"""

import os
import sys
import subprocess
import zipfile
from pypdf import PdfReader, PdfWriter

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
SOURCE_DIR = os.path.join(CCNA_DIR, "07_SOURCE_FILES")
ENG_DIR = os.path.join(SOURCE_DIR, "English")
HI_DIR = os.path.join(SOURCE_DIR, "Hindi")
ENGINE_DIR = os.path.join(SOURCE_DIR, "07_PUBLISHING_ENGINE")
CORE_OUT = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION")
LAB_DIR = os.path.join(CCNA_DIR, "02_PRACTICAL_LAB_WORKBOOK")
INTERVIEW_DIR = os.path.join(CCNA_DIR, "03_INTERVIEW_QUESTION_VAULT")
CAREER_DIR = os.path.join(CCNA_DIR, "04_CAREER_AND_SALARY_BLUEPRINT")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")

os.makedirs(ENG_DIR, exist_ok=True)
os.makedirs(HI_DIR, exist_ok=True)
os.makedirs(ENGINE_DIR, exist_ok=True)
os.makedirs(CORE_OUT, exist_ok=True)
os.makedirs(os.path.join(LAB_DIR, "source"), exist_ok=True)
os.makedirs(os.path.join(INTERVIEW_DIR, "source"), exist_ok=True)
os.makedirs(os.path.join(CAREER_DIR, "source"), exist_ok=True)
os.makedirs(DOWNLOADS_DIR, exist_ok=True)

print("Directories initialized successfully.")
