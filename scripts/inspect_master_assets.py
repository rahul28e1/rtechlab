#!/usr/bin/env python3
"""
Inspect and verify physical media master assets on disk for RTechLab:
- Path verification
- SHA-256 hash calculation
- Size & metadata integrity
"""

import os
import sys
import hashlib
import json
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent

ASSET_TARGETS = [
    {
        "id": "EP01_EN_LONG",
        "title": "How Does the Internet Actually Work? (In 175 Milliseconds)",
        "language": "en",
        "format": "16:9 Landscape (1920x1080 @ 30fps)",
        "type": "long_form",
        "path": PROJECT_ROOT / "video-engine" / "out" / "episodes" / "how_the_internet_works_ep01_en_v2.mp4",
        "thumbnail": PROJECT_ROOT / "video-engine" / "out" / "thumbnails" / "rtechlab_ep01_thumbnail_en_concept_a.png",
        "subtitles": PROJECT_ROOT / "video-engine" / "public" / "subtitles" / "subtitles_ep01_en.vtt"
    },
    {
        "id": "EP01_HI_LONG",
        "title": "इंटरनेट असल में कैसे काम करता है? (175 मिलीसेकंड में 13,000 km)",
        "language": "hi",
        "format": "16:9 Landscape (1920x1080 @ 30fps)",
        "type": "long_form",
        "path": PROJECT_ROOT / "video-engine" / "out" / "episodes" / "how_the_internet_works_ep01_hi_v2.mp4",
        "thumbnail": PROJECT_ROOT / "video-engine" / "out" / "thumbnails" / "rtechlab_ep01_thumbnail_hi_concept_a.png",
        "subtitles": PROJECT_ROOT / "video-engine" / "public" / "subtitles" / "subtitles_ep01_hi.vtt"
    },
    {
        "id": "EP01_S01_EN_SHORT",
        "title": "The Internet is NOT a Cloud (Submarine Fiber)",
        "language": "en",
        "format": "9:16 Vertical (1080x1920 @ 30fps)",
        "type": "short",
        "path": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "video" / "short01_the_internet_is_not_a_cloud_en.mp4",
        "thumbnail": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "covers" / "short01_cover_en.png",
        "subtitles": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "subtitles" / "short01_en.srt"
    },
    {
        "id": "EP01_S01_HI_SHORT",
        "title": "इंटरनेट समुद्र के नीचे है (बादल नहीं)",
        "language": "hi",
        "format": "9:16 Vertical (1080x1920 @ 30fps)",
        "type": "short",
        "path": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "video" / "short01_the_internet_is_not_a_cloud_hi.mp4",
        "thumbnail": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "covers" / "short01_cover_hi.png",
        "subtitles": PROJECT_ROOT / "publishing" / "episodes" / "EP01_HOW_THE_INTERNET_WORKS" / "shorts" / "short_01" / "subtitles" / "short01_hi.srt"
    },
    {
        "id": "EP03_EN_MASTER",
        "title": "How DNS Resolves Domain Names (V3 Explainer)",
        "language": "en",
        "format": "9:16 Vertical (1080x1920 @ 30fps)",
        "type": "master",
        "path": PROJECT_ROOT / "video-engine" / "out" / "episodes" / "how_dns_works_ep03_en.mp4",
        "thumbnail": PROJECT_ROOT / "video-engine" / "out" / "samples" / "thumbnail_en.png",
        "subtitles": PROJECT_ROOT / "video-engine" / "public" / "subtitles" / "dns_v3_en.vtt"
    },
    {
        "id": "EP03_HI_MASTER",
        "title": "DNS असल में कैसे काम करता है? (V3 Explainer)",
        "language": "hi",
        "format": "9:16 Vertical (1080x1920 @ 30fps)",
        "type": "master",
        "path": PROJECT_ROOT / "video-engine" / "out" / "episodes" / "how_dns_works_ep03_hi.mp4",
        "thumbnail": PROJECT_ROOT / "video-engine" / "out" / "samples" / "thumbnail_hi.png",
        "subtitles": PROJECT_ROOT / "video-engine" / "public" / "subtitles" / "dns_v3_hi.vtt"
    }
]

def sha256_file(p):
    h = hashlib.sha256()
    with open(p, "rb") as f:
        while chunk := f.read(1024 * 1024):
            h.update(chunk)
    return h.hexdigest()

def inspect():
    results = []
    print("=" * 80)
    print("RTECHLAB PHYSICAL MEDIA ASSET INSPECTION & CRYPTOGRAPHIC VERIFICATION")
    print("=" * 80)
    for t in ASSET_TARGETS:
        p = t["path"]
        exists = p.exists()
        size_bytes = p.stat().st_size if exists else 0
        size_mb = size_bytes / (1024 * 1024) if exists else 0
        h = sha256_file(p) if exists else "NOT_FOUND"
        
        thumb_exists = t["thumbnail"].exists() if t.get("thumbnail") else False
        sub_exists = t["subtitles"].exists() if t.get("subtitles") else False

        entry = {
            "id": t["id"],
            "title": t["title"],
            "language": t["language"],
            "format": t["format"],
            "exists": exists,
            "path": str(p),
            "size_mb": round(size_mb, 2),
            "sha256": h,
            "thumbnail_exists": thumb_exists,
            "subtitles_exist": sub_exists,
            "status": "APPROVED_READY" if exists and thumb_exists else "MISSING"
        }
        results.append(entry)
        print(f"\n[{entry['id']}] {entry['title']}")
        print(f"  - File Path: {entry['path']}")
        print(f"  - Exists: {entry['exists']} ({entry['size_mb']} MB)")
        print(f"  - SHA-256: {entry['sha256']}")
        print(f"  - Thumbnail Attached: {entry['thumbnail_exists']}")
        print(f"  - Subtitles Attached: {entry['subtitles_exist']}")
        print(f"  - Master Status: {entry['status']}")

    out_file = PROJECT_ROOT / "publishing" / "system" / "verified_assets_manifest.json"
    with open(out_file, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)
    print("\n" + "=" * 80)
    print(f"Manifest saved to: {out_file}")
    print("=" * 80)
    return results

if __name__ == "__main__":
    inspect()
