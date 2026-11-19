import asyncio
import edge_tts
from pathlib import Path
import json

AUDIO_DIR = Path("video-engine/public/audio")
SUBTITLE_DIR = Path("video-engine/public/subtitles")
DATA_DIR = Path("video-engine/src/data")

VOICE_EN = "en-US-ChristopherNeural"
VOICE_HI = "hi-IN-MadhurNeural"

SCRIPTS = [
    {
        "id": "ep01_13000km_175ms",
        "lang": "en",
        "text": "When you tap a video on your smartphone, how does it load from a server thirteen thousand kilometers away in just 175 milliseconds? Let's trace the physical speed of light. First, your phone sends radio signals to your Wi-Fi router in two milliseconds. Your router converts data into infrared laser pulses inside silica optical fiber. Inside glass, light travels at two hundred and four thousand kilometers per second. It races through thirteen thousand kilometers of deep-sea cables crossing oceans in just sixty-five milliseconds! The cloud server in Virginia processes your request in ten milliseconds, and beams the 4K video frames back along the exact same optical path. Thirteen thousand kilometers out, thirteen thousand kilometers back—total round trip: 175 milliseconds. That is the physics of the global Internet. Technology made practical with RTechLab."
    },
    {
        "id": "ep01_13000km_175ms",
        "lang": "hi",
        "text": "जब आप स्मार्टफोन पर कोई वीडियो टैप करते हैं, तो 13,000 किलोमीटर दूर बैठे सर्वर से वह सिर्फ 175 मिलीसेकंड में कैसे लोड हो जाता है? जानिए प्रकाश की असली गति का गणित! सबसे पहले आपका फोन वाई-फाई राउटर को 2 मिलीसेकंड में रेडियो सिग्नल भेजता है। राउटर इस डेटा को इन्फ्रारेड लेज़र पल्स में बदलकर ऑप्टिकल फाइबर में डालता है। कांच के अंदर रोशनी 204,000 किलोमीटर प्रति सेकंड की रफ्तार से दौड़ती है। यह 13,000 किलोमीटर गहरे समुद्र की केबल्स पार करके सिर्फ 65 मिलीसेकंड में अमेरिका के डेटा सेंटर पहुंचती है! वहां सर्वर 10 मिलीसेकंड में वीडियो प्रोसेस करता है और उसी रास्ते से वीडियो पैकेट्स वापस भेजता है। 13,000 km जाना, 13,000 km आना—कुल समय सिर्फ 175 मिलीसेकंड! RTechLab के साथ सीखें प्रैक्टिकल नेटवर्किंग।"
    }
]

async def synthesize_item(item):
    s_id = item["id"]
    lang = item["lang"]
    text = item["text"]
    voice = VOICE_HI if lang == "hi" else VOICE_EN
    
    mp3_path = AUDIO_DIR / f"{s_id}_{lang}.mp3"
    vtt_path = SUBTITLE_DIR / f"{s_id}_{lang}.vtt"
    js_cues_path = DATA_DIR / f"cues_{s_id}_{lang}.js"
    
    print(f"[*] Synthesizing {s_id}_{lang}.mp3...")
    comm = edge_tts.Communicate(text, voice)
    
    cues = []
    with open(mp3_path, "wb") as f_mp3:
        async for chunk in comm.stream():
            if chunk["type"] == "audio":
                f_mp3.write(chunk["data"])
            elif chunk["type"] in ("WordBoundary", "SentenceBoundary"):
                start_s = chunk["offset"] / 10_000_000.0
                dur_s = chunk["duration"] / 10_000_000.0
                t = chunk.get("text", "")
                cues.append({
                    "start": round(start_s, 3),
                    "end": round(start_s + dur_s, 3),
                    "startFrame": int(round(start_s * 30)),
                    "endFrame": int(round((start_s + dur_s) * 30)),
                    "text": t
                })
                
    grouped = []
    curr_words = []
    curr_start = None
    curr_end = None
    
    for c in cues:
        if curr_start is None:
            curr_start = c["start"]
        curr_words.append(c["text"])
        curr_end = c["end"]
        
        if c["text"].endswith((".", "!", "?", "।", "—")) or len(curr_words) >= 6:
            sentence_text = " ".join(curr_words).strip()
            grouped.append({
                "start": curr_start,
                "end": curr_end,
                "startFrame": int(round(curr_start * 30)),
                "endFrame": int(round(curr_end * 30)),
                "text": sentence_text
            })
            curr_words = []
            curr_start = None
            curr_end = None
            
    if curr_words:
        sentence_text = " ".join(curr_words).strip()
        grouped.append({
            "start": curr_start,
            "end": curr_end,
            "startFrame": int(round(curr_start * 30)),
            "endFrame": int(round(curr_end * 30)),
            "text": sentence_text
        })
        
    with open(vtt_path, "w", encoding="utf-8") as f_vtt:
        f_vtt.write("WEBVTT\n\n")
        for i, g in enumerate(grouped, 1):
            def fmt(t):
                m = int(t // 60)
                s = t % 60
                return f"00:{m:02d}:{s:06.3f}"
            f_vtt.write(f"{i}\n{fmt(g['start'])} --> {fmt(g['end'])}\n{g['text']}\n\n")
            
    var_name = f"CUES_{s_id.upper()}_{lang.upper()}"
    with open(js_cues_path, "w", encoding="utf-8") as f_js:
        f_js.write(f"export const {var_name} = {json.dumps(grouped, ensure_ascii=False, indent=2)};\n")
        
    print(f"  [+] Saved {mp3_path.name} & {js_cues_path.name} ({len(grouped)} cues)")

async def main():
    for item in SCRIPTS:
        await synthesize_item(item)
    print("\n[+] EP01 Short 03 Narration & Subtitles Synthesized!")

if __name__ == "__main__":
    asyncio.run(main())
