import os
import subprocess

FFMPEG = "C:/Users/Rahul/Videos/My projects/RtechLab/video-engine/node_modules/@remotion/compositor-win32-x64-msvc/ffmpeg.exe"

def build_reel_mp4():
    scenes_dir = os.path.abspath("public/brand/reel_scenes")
    concat_file = os.path.join(scenes_dir, "concat_list.txt")

    with open(concat_file, "w", encoding="utf-8") as f:
        f.write(f"file '{os.path.join(scenes_dir, 'scene1.png')}'\n")
        f.write("duration 11.0\n")
        f.write(f"file '{os.path.join(scenes_dir, 'scene2.png')}'\n")
        f.write("duration 10.0\n")
        f.write(f"file '{os.path.join(scenes_dir, 'scene3.png')}'\n")
        f.write("duration 25.0\n")
        f.write(f"file '{os.path.join(scenes_dir, 'scene4.png')}'\n")
        f.write("duration 9.0\n")
        f.write(f"file '{os.path.join(scenes_dir, 'scene5.png')}'\n")
        f.write("duration 13.0\n")
        f.write(f"file '{os.path.join(scenes_dir, 'scene5.png')}'\n")

    voiceover = os.path.abspath("public/brand/reel_voiceover_punchy.mp3")
    bg_music = os.path.abspath("video-engine/public/audio/music_ambient_tech.wav")
    output_video = os.path.abspath("public/brand/rtechlab_official_notes_reel_49.mp4")

    # Use amix with stream_loop for background music
    filter_complex = (
        "[1:a]volume=1.0[vo];"
        "[2:a]volume=0.12[bg];"
        "[vo][bg]amix=inputs=2:duration=first:dropout_transition=2[aout]"
    )

    cmd = [
        FFMPEG,
        "-y",
        "-f", "concat",
        "-safe", "0",
        "-i", concat_file,
        "-i", voiceover,
        "-stream_loop", "-1",
        "-i", bg_music,
        "-filter_complex", filter_complex,
        "-map", "0:v",
        "-map", "[aout]",
        "-c:v", "libx264",
        "-r", "30",
        "-pix_fmt", "yuv420p",
        "-c:a", "aac",
        "-b:a", "192k",
        "-shortest",
        output_video
    ]

    print("Running FFmpeg compilation...")
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if res.returncode == 0:
        print(f"SUCCESS! Reel video exported to: {output_video}")
        size_mb = os.path.getsize(output_video) / (1024 * 1024)
        print(f"File size: {size_mb:.2f} MB")
    else:
        print("FFmpeg error:", res.stderr)

if __name__ == "__main__":
    build_reel_mp4()
