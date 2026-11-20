"""
RTechLab CCNA 200-301 Complete Master Publishing Suite Generator
Authors: Rahul Patel & RTechLab Systems Lab
"""

import os
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

# Ensure all directories exist
for d in [ENG_DIR, HI_DIR, ENGINE_DIR, CORE_OUT, 
          os.path.join(LAB_DIR, "source"), 
          os.path.join(INTERVIEW_DIR, "source"), 
          os.path.join(CAREER_DIR, "source"), 
          DOWNLOADS_DIR]:
    os.makedirs(d, exist_ok=True)

print("[INFO] Initializing CCNA 200-301 Master Publishing Suite Generation...")
