# -*- coding: utf-8 -*-
import os, time, sys
sys.path.insert(0, os.path.abspath("scripts"))
from december_episodes_data import DECEMBER_EPISODES

cutoff = time.mktime(time.strptime('2026-11-15 22:25:00', '%Y-%m-%d %H:%M:%S'))
base = r'c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS'

print("="*65)
print("EPISODE RENDER STATUS (CUTOFF: 2026-11-15 22:25:00)")
print("="*65)
pending_hi = 0
pending_en = 0

for ep_key, ep in DECEMBER_EPISODES.items():
    vdir = os.path.join(base, ep['folder'], 'FINAL_VIDEOS')
    num = ep['num']
    hi = os.path.join(vdir, f"{num}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4")
    en = os.path.join(vdir, f"{num}_{ep['short_title'].replace(' ', '_')}_English.mp4")
    hi_ok = os.path.exists(hi) and os.path.getsize(hi) > 1000000 and os.path.getmtime(hi) > cutoff
    en_ok = os.path.exists(en) and os.path.getsize(en) > 1000000 and os.path.getmtime(en) > cutoff
    hi_size = f"{os.path.getsize(hi)/1024/1024:.1f}MB" if os.path.exists(hi) else "MISSING"
    en_size = f"{os.path.getsize(en)/1024/1024:.1f}MB" if os.path.exists(en) else "MISSING"
    
    status_hi = "✅ FIXED" if hi_ok else f"⏳ PENDING ({hi_size})"
    status_en = "✅ FIXED" if en_ok else f"⏳ PENDING ({en_size})"
    if not hi_ok: pending_hi += 1
    if not en_ok: pending_en += 1
    print(f"{num:5} | {ep['date_code']} | HI: {status_hi:18} | EN: {status_en:18}")

print("="*65)
print(f"Summary: Pending Hindi: {pending_hi}, Pending English: {pending_en}")
