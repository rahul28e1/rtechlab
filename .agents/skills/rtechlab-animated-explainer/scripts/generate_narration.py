#!/usr/bin/env python3
"""
RTechLab Audio & Subtitle Narration Generator
Uses edge-tts to produce high-fidelity neural narration and synchronized subtitles.
Supports English (en-US-ChristopherNeural) and Hindi (hi-IN-MadhurNeural).
"""

import asyncio
import os
import sys
import json
import re
import edge_tts

VOICE_CONFIG = {
    "en": {"voice": "en-US-ChristopherNeural", "rate": "+12%"},
    "hi": {"voice": "hi-IN-MadhurNeural", "rate": "+24%"}
}

def vtt_to_srt(vtt_content):
    """Convert WebVTT formatted subtitles into SubRip (SRT) format."""
    lines = vtt_content.strip().splitlines()
    srt_lines = []
    counter = 1
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if not line or line.startswith("WEBVTT"):
            i += 1
            continue
        # Look for timestamp line (00:00:00.000 --> 00:00:02.000)
        if "-->" in line:
            srt_lines.append(str(counter))
            counter += 1
            # Replace dot with comma in timestamps
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

async def synthesize(text, lang, output_audio_path, output_sub_path):
    cfg = VOICE_CONFIG.get(lang, {"voice": "en-US-ChristopherNeural", "rate": "+0%"})
    voice = cfg["voice"]
    rate = cfg["rate"]
    print(f"[*] Synthesizing narration with voice: {voice} (rate: {rate})")
    print(f"[*] Target audio: {output_audio_path}")
    
    os.makedirs(os.path.dirname(os.path.abspath(output_audio_path)), exist_ok=True)
    os.makedirs(os.path.dirname(os.path.abspath(output_sub_path)), exist_ok=True)
    
    communicate = edge_tts.Communicate(text, voice, rate=rate)
    submaker = edge_tts.SubMaker()
    
    with open(output_audio_path, "wb") as audio_file:
        async for chunk in communicate.stream():
            if chunk["type"] == "audio":
                audio_file.write(chunk["data"])
            elif chunk["type"] in ("WordBoundary", "SentenceBoundary"):
                submaker.feed(chunk)
                
    # Generate subtitles via SubMaker
    raw_sub = submaker.get_srt()
    srt_content = vtt_to_srt(raw_sub) if "WEBVTT" in raw_sub else raw_sub
    
    with open(output_sub_path, "w", encoding="utf-8") as srt_file:
        srt_file.write(srt_content)
        
    print(f"[+] Narration audio saved to: {output_audio_path}")
    print(f"[+] Subtitles saved to: {output_sub_path}")

if __name__ == "__main__":
    if len(sys.argv) < 5:
        print("Usage: generate_narration.py <text_or_script_file> <lang: en|hi> <output_audio.mp3> <output_sub.srt>")
        sys.exit(1)
        
    input_arg = sys.argv[1]
    if os.path.exists(input_arg):
        with open(input_arg, "r", encoding="utf-8") as f:
            script_text = f.read()
    else:
        script_text = input_arg
        
    language = sys.argv[2]
    out_audio = sys.argv[3]
    out_sub = sys.argv[4]
    
    asyncio.run(synthesize(script_text, language, out_audio, out_sub))
