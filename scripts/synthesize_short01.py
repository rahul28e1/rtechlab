import asyncio
import os
import json
import re
import edge_tts

TEXT_EN = (
    "The Internet is NOT a cloud floating in the sky. "
    "In fact, over ninety-nine percent of all global internet traffic travels through physical glass cables resting on the ocean floor! "
    "When you tap a video on your phone, your signal doesn't bounce off satellites in space. "
    "It turns into pulses of infrared laser light, racing through pure silica glass at over two hundred thousand kilometers per second. "
    "These subsea cables stretch across 1.4 million kilometers to reach massive data centers in Virginia, "
    "where seventy percent of global traffic flows through rows of physical servers. "
    "The cloud is simply someone else's physical computer, connected to yours through thousands of kilometers of real glass and steel. "
    "Technology made practical. Follow RTechLab, and watch our full Episode 01 on YouTube!"
)

TEXT_HI = (
    "इंटरनेट आसमान में तैरने वाला कोई क्लाउड या बादल नहीं है! "
    "असल में, दुनिया का निन्यानवे प्रतिशत इंटरनेट समुद्र के हज़ारों मीटर नीचे बिछी भारी ग्लास केबल्स पर चलता है। "
    "जब आप फोन पर कोई वीडियो टैप करते हैं, तो सिग्नल स्पेस में सैटेलाइट्स से नहीं टकराता। "
    "यह इन्फ्रारेड लेज़र लाइट में बदलकर, बाल जितनी पतली ऑप्टिकल फ़ाइबर में दो लाख किलोमीटर प्रति सेकंड की रफ़्तार से दौड़ता है। "
    "यह सबसी केबल्स चौदह लाख किलोमीटर से ज़्यादा समुद्र तल पर फैली हैं, जो वर्जीनिया जैसे विशाल डेटा सेंटर्स तक पहुंचती हैं, जहाँ फ़िज़िकल सर्वर्स आपका डेटा प्रोसेस करते हैं। "
    "यानी क्लाउड कोई जादू नहीं, बल्कि हज़ारों किलोमीटर लंबी असली ग्लास और स्टील की केबल्स से जुड़ा एक फ़िज़िकल कंप्यूटर है। "
    "Technology Made Practical. इंटरनेट की असली इंजीनियरिंग सीखने के लिए RTechLab को अभी फॉलो करें, और हमारा फुल एपिसोड ज़रूर देखें!"
)

VOICES = {
    "en": {"voice": "en-US-ChristopherNeural", "rate": "+10%"},
    "hi": {"voice": "hi-IN-MadhurNeural", "rate": "+12%"}
}

def vtt_to_srt(vtt_content):
    lines = vtt_content.strip().splitlines()
    srt_lines = []
    counter = 1
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if not line or line.startswith("WEBVTT"):
            i += 1
            continue
        if "-->" in line:
            srt_lines.append(str(counter))
            counter += 1
            formatted_time = re.sub(r'(\d{2}:\d{2}:\d{2})\.(\d{3})', r'\1,\2', line)
            srt_lines.append(formatted_time)
            i += 1
            text_lines = []
            while i < len(lines) and lines[i].strip() and not ("-->" in lines[i]):
                text_lines.append(lines[i].strip())
                i += 1
            srt_lines.append(" ".join(text_lines))
            srt_lines.append("")
        else:
            i += 1
    return "\n".join(srt_lines)

async def synthesize_track(lang, text, out_audio_path, out_srt_path, out_vtt_path):
    os.makedirs(os.path.dirname(out_audio_path), exist_ok=True)
    os.makedirs(os.path.dirname(out_srt_path), exist_ok=True)
    
    cfg = VOICES[lang]
    comm = edge_tts.Communicate(text, cfg["voice"], rate=cfg["rate"])
    submaker = edge_tts.SubMaker()
    
    with open(out_audio_path, "wb") as f:
        async for chunk in comm.stream():
            if chunk["type"] == "audio":
                f.write(chunk["data"])
            elif chunk["type"] in ("WordBoundary", "SentenceBoundary"):
                submaker.feed(chunk)
                
    raw_vtt = submaker.get_srt() # edge_tts produces WebVTT formatted cues
    # write VTT
    vtt_content = "WEBVTT\n\n" + raw_vtt if not raw_vtt.startswith("WEBVTT") else raw_vtt
    with open(out_vtt_path, "w", encoding="utf-8") as f:
        f.write(vtt_content)
        
    srt_content = vtt_to_srt(raw_vtt)
    with open(out_srt_path, "w", encoding="utf-8") as f:
        f.write(srt_content)
        
    print(f"[{lang.upper()}] Audio & Subtitles generated successfully.")
    return submaker.cues

async def main():
    print("Synthesizing Short 01 Audio...")
    base_dir = os.path.dirname(os.path.abspath(__file__))
    workspace_root = os.path.abspath(os.path.join(base_dir, ".."))
    
    pub_dir = os.path.join(workspace_root, "publishing", "episodes", "EP01_HOW_THE_INTERNET_WORKS", "shorts", "short_01")
    audio_engine_dir = os.path.join(workspace_root, "video-engine", "public", "audio")
    
    en_audio = os.path.join(audio_engine_dir, "short01_en.mp3")
    en_srt = os.path.join(pub_dir, "subtitles", "short01_en.srt")
    en_vtt = os.path.join(pub_dir, "subtitles", "short01_en.vtt")
    
    hi_audio = os.path.join(audio_engine_dir, "short01_hi.mp3")
    hi_srt = os.path.join(pub_dir, "subtitles", "short01_hi.srt")
    hi_vtt = os.path.join(pub_dir, "subtitles", "short01_hi.vtt")
    
    await synthesize_track("en", TEXT_EN, en_audio, en_srt, en_vtt)
    await synthesize_track("hi", TEXT_HI, hi_audio, hi_srt, hi_vtt)

if __name__ == "__main__":
    asyncio.run(main())
