import json
import struct
import os

def dur(fn):
    if not os.path.exists(fn):
        return 0
    with open(fn, 'rb') as f:
        while True:
            h = f.read(8)
            if len(h) < 8:
                break
            sz, t = struct.unpack('>I4s', h)
            if t == b'moov':
                md = f.read(sz - 8)
                idx = md.find(b'mvhd')
                if idx != -1:
                    v = md[idx+4]
                    if v == 0:
                        ts, d = struct.unpack('>II', md[idx+16:idx+24])
                    else:
                        ts, d = struct.unpack('>IQ', md[idx+24:idx+36])
                    return d / ts
                break
            elif sz == 1:
                f.seek(struct.unpack('>Q', f.read(8))[0] - 16, 1)
            else:
                f.seek(sz - 8, 1)
    return 0

with open('publishing/system/december_instagram_schedule_manifest.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

for s in data['queue']:
    d = dur(s['video_path'])
    flag = '⚠️ OVER 90s' if d > 90 else 'OK'
    print(f"{s['slot_id']:10} | {d:5.1f}s | {flag:12} | {os.path.basename(s['video_path'])}")
