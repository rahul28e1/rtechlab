import csv
import json
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
HUB_DIR = PROJECT_ROOT / "PUBLISHING_HUB"
INDEX_CSV = HUB_DIR / "MASTER_PUBLISHING_INDEX.csv"
QUEUE_JSON = PROJECT_ROOT / "publishing" / "system" / "master_publishing_queue.json"

def sync_index():
    queue = json.loads(QUEUE_JSON.read_text(encoding="utf-8"))

    headers = [
        "Date", "Topic", "Format", "Language", "Episode_Code",
        "Video_Path", "Caption_Path", "Thumbnail_Path", "Release_Time_IST",
        "QA_Status", "Publishing_Status", "Instagram_URL", "YouTube_URL", "Operational_Queue_Status"
    ]

    grouped = {}
    for it in queue:
        g_key = (it["date"], it["episode_code"], it["format"], it["lang"])
        grouped.setdefault(g_key, {})[it["platform"]] = it

    combined_rows = []
    for (d, ep, fmt, lang), p_dict in grouped.items():
        ig_item = p_dict.get("Instagram", {})
        yt_item = p_dict.get("YouTube", {})
        
        rep = yt_item if yt_item else ig_item
        
        ig_url = ig_item.get("published_url", "")
        yt_url = yt_item.get("published_url", "")
        
        ig_status = ig_item.get("status", "READY")
        yt_status = yt_item.get("status", "READY")
        
        if ig_status == "LIVE" and yt_status == "LIVE":
            pub_status = "ALREADY PUBLISHED (ALL PLATFORMS)"
            op_status = "LIVE"
        elif ig_status == "LIVE" and yt_status != "LIVE":
            pub_status = f"ALREADY PUBLISHED (INSTAGRAM) / {yt_status} (YOUTUBE)"
            op_status = f"SCHEDULED (YOUTUBE)" if yt_status == "SCHEDULED" else "MANUAL_REQUIRED (YOUTUBE)"
        elif yt_status == "SCHEDULED":
            pub_status = "SCHEDULED (YOUTUBE AUTOMATION)"
            op_status = "SCHEDULED"
        else:
            pub_status = "READY FOR PUBLISHING (PRODUCED & QA PASSED)"
            op_status = "READY"
            
        combined_rows.append({
            "Date": d,
            "Topic": f"{ep} - {rep.get('title', '')}",
            "Format": fmt,
            "Language": "English" if lang == "EN" else "Hindi",
            "Episode_Code": ep,
            "Video_Path": rep.get("video_path", ""),
            "Caption_Path": rep.get("caption_path", ""),
            "Thumbnail_Path": rep.get("thumbnail_path", ""),
            "Release_Time_IST": rep.get("scheduled_time_ist", ""),
            "QA_Status": "PASS",
            "Publishing_Status": pub_status,
            "Instagram_URL": ig_url or "",
            "YouTube_URL": yt_url or "",
            "Operational_Queue_Status": op_status
        })

    combined_rows.sort(key=lambda x: (x["Date"], 0 if x["Format"] == "Short (9:16)" else 1, 0 if x["Language"] == "English" else 1))

    with open(INDEX_CSV, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=headers)
        writer.writeheader()
        writer.writerows(combined_rows)

    print(f"Successfully synced MASTER_PUBLISHING_INDEX.csv ({len(combined_rows)} rows)!")

if __name__ == "__main__":
    sync_index()
