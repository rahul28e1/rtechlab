# -*- coding: utf-8 -*-
"""
Generate Remotion Compositions and Cue Files for December Episodes (EP03 to EP16)
Calculates exact frame durations from generated MP3 stems and writes:
- video-engine/src/compositions/december/configs/{ep_key}_config.js
- Registers compositions in video-engine/src/Root.jsx
"""

import os
import math
import json
from december_episodes_data import DECEMBER_EPISODES

AUDIO_BASE = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\public\audio\december"
CONFIGS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\src\compositions\december\configs"
ROOT_PATH = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\src\Root.jsx"

def get_mp3_duration(path):
    if not os.path.exists(path) or os.path.getsize(path) == 0:
        return 12.0
    with open(path, "rb") as f:
        data = f.read()
    pos = 0
    if data[:3] == b"ID3":
        tag_size = ((data[6] & 0x7F) << 21) | ((data[7] & 0x7F) << 14) | ((data[8] & 0x7F) << 7) | (data[9] & 0x7F)
        pos = 10 + tag_size
    duration = 0.0
    while pos < len(data) - 4:
        if data[pos] == 0xFF and (data[pos+1] & 0xE0) == 0xE0:
            duration += 1152.0 / 24000.0
            pos += 200
        else:
            pos += 1
    return duration

SCENE_META = {
    "s1_hook": {
        "stepBadge": "SCENE 1 • PROBLEM HOOK",
        "icon": "alert",
        "accentColor": "#F59E0B",
        "bgGradient": "radial-gradient(circle at 50% 38%, #FEF3C7 0%, #F0F8FF 45%, #FFFFFF 85%)",
        "highlightStat": {"label": "Real-Time Surge", "value": "10,00,000+ Reqs/Sec"}
    },
    "s2_problem": {
        "stepBadge": "SCENE 2 • ARCHITECTURE CHALLENGE",
        "icon": "flame",
        "accentColor": "#EF4444",
        "bgGradient": "radial-gradient(circle at 50% 38%, #FEE2E2 0%, #F0F8FF 45%, #FFFFFF 85%)",
        "highlightStat": {"label": "Threshold Failure", "value": "504 Gateway Timeout"}
    },
    "s3_ingress": {
        "stepBadge": "SCENE 3 • INGRESS PERIMETER",
        "icon": "shield",
        "accentColor": "#25B6F9",
        "bgGradient": "radial-gradient(circle at 50% 38%, #E0F2FE 0%, #FFFFFF 75%)",
        "highlightStat": {"label": "Scraper Blocking", "value": "90% Dropped at Edge"}
    },
    "s4_throttling": {
        "stepBadge": "SCENE 4 • CONCURRENCY SHEDDING",
        "icon": "layers",
        "accentColor": "#8B5CF6",
        "bgGradient": "radial-gradient(circle at 50% 38%, #EDE9FE 0%, #FFFFFF 75%)",
        "highlightStat": {"label": "Queue Algorithm", "value": "Token Bucket"}
    },
    "s5_db_read": {
        "stepBadge": "SCENE 5 • IN-MEMORY ACCELERATION",
        "icon": "zap",
        "accentColor": "#10B981",
        "bgGradient": "radial-gradient(circle at 50% 38%, #D1FAE5 0%, #FFFFFF 75%)",
        "highlightStat": {"label": "Cache Latency", "value": "Sub-1ms Redis"}
    },
    "s6_payment_queue": {
        "stepBadge": "SCENE 6 • FAILOVER & RESILIENCE",
        "icon": "cpu",
        "accentColor": "#0284C7",
        "bgGradient": "radial-gradient(circle at 50% 38%, #E0F2FE 0%, #FFFFFF 75%)",
        "highlightStat": {"label": "Redundancy", "value": "Multi-Gateway Mesh"}
    },
    "s7_arch_lesson": {
        "stepBadge": "SCENE 7 • SENIOR ARCHITECT RULE",
        "icon": "award",
        "accentColor": "#192446",
        "bgGradient": "radial-gradient(circle at 50% 38%, #F3F4F6 0%, #FFFFFF 75%)",
        "highlightStat": {"label": "Design Principle", "value": "Decoupled Scalability"}
    },
    "s8_outro": {
        "stepBadge": "SCENE 8 • CONTINUITY & BRANDING",
        "icon": "award",
        "accentColor": "#F59E0B",
        "bgGradient": "radial-gradient(circle at 50% 45%, #FEF3C7 0%, #F0F8FF 50%, #FFFFFF 90%)"
    }
}

def generate_configs():
    os.makedirs(CONFIGS_DIR, exist_ok=True)
    comp_list = []

    for ep_key, ep in DECEMBER_EPISODES.items():
        ep_audio_dir = os.path.join(AUDIO_BASE, ep_key)
        scenes_data = []
        cues_hi = []
        cues_en = []
        total_frames = 0

        for idx, (code, text_hi) in enumerate(ep["scenes_hi"]):
            text_en = ep["scenes_en"][idx][1]
            hp = os.path.join(ep_audio_dir, f"hi_{code}.mp3")
            ep_p = os.path.join(ep_audio_dir, f"en_{code}.mp3")
            hd = get_mp3_duration(hp)
            ed = get_mp3_duration(ep_p)
            max_d = max(hd, ed)
            frames = int(math.ceil(max_d * 30)) + 15
            start = total_frames
            end = start + frames
            total_frames = end

            meta = SCENE_META.get(code, SCENE_META["s3_ingress"])

            # Cues
            cues_hi.append({"startFrame": start, "endFrame": end, "text": text_hi})
            cues_en.append({"startFrame": start, "endFrame": end, "text": text_en})

            # Headline & Subheadline
            headline = text_hi.split("!")[0] if "!" in text_hi else text_hi[:45]
            subheadline = text_hi[len(headline):len(headline)+80].strip("! .") if len(text_hi) > len(headline) else ""

            scenes_data.append({
                "name": code,
                "audioStem": code,
                "startFrame": start,
                "durationInFrames": frames,
                "stepBadge": meta["stepBadge"],
                "icon": meta["icon"],
                "accentColor": meta["accentColor"],
                "bgGradient": meta["bgGradient"],
                "headline": headline,
                "subheadline": subheadline,
                "nodes": [
                    {"title": "Client App", "status": "REQUESTING", "statusColor": "#25B6F9"},
                    {"title": "Edge Ingress", "status": "FILTERED", "statusColor": "#10B981"},
                    {"title": "Core Cluster", "status": "PROCESSED", "statusColor": "#8B5CF6"}
                ],
                "bullets": [
                    text_hi[:65] + "...",
                    "Sub-second distributed state sync & zero data loss guarantee."
                ],
                "highlightStat": meta.get("highlightStat", {"label": "Engine", "value": "Active"})
            })

        config_obj = {
            "epKey": ep_key,
            "epNumber": ep["num"],
            "dateLabel": f"{ep['date_code']}.2026",
            "titleHI": ep["title_hi"],
            "titleEN": ep["title_en"],
            "totalFrames": total_frames,
            "outro": {
                "nextEpisode": ep["next_ep"],
                "teaserQuestion": ep["next_hook_hi"]
            },
            "cuesHI": cues_hi,
            "cuesEN": cues_en,
            "scenes": scenes_data
        }

        # Write config file
        out_js = os.path.join(CONFIGS_DIR, f"{ep_key}_config.js")
        with open(out_js, "w", encoding="utf-8") as f:
            f.write(f"export const {ep_key.upper()}_CONFIG = {json.dumps(config_obj, indent=2, ensure_ascii=False)};\n")

        comp_list.append((ep_key, ep["num"], total_frames))
        print(f"Generated config for {ep['num']}: {total_frames} frames ({total_frames/30:.2f}s)")

    return comp_list

if __name__ == "__main__":
    generate_configs()
