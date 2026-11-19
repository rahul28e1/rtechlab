import os
import json
import hashlib
from pathlib import Path
import qrcode
from qrcode.image.svg import SvgPathImage
from PIL import Image

QR_ROOT = Path("RTECHLAB_AI_PUBLISHING_ENGINE/08_QR_CODE_SYSTEM")
ASSET_DIR = Path("RTECHLAB_AI_PUBLISHING_ENGINE/04_VISUAL_ASSET_ENGINE/icons")
REGISTER_FILE = QR_ROOT / "qr-register" / "qr-register.json"

DEFAULT_BASE_URL = "http://localhost:5173" # Development base URL until production domain is active

def generate_chapter_qr(chapter_id, topic_slug, base_url=DEFAULT_BASE_URL, env="development"):
    destination_url = f"{base_url}/practice/{topic_slug}"
    qr_id = f"QR-{chapter_id.upper()}-{topic_slug.replace('/', '-')}"
    
    # 1. High Error Correction (Level H - 30% recovery)
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_H,
        box_size=10,
        border=3,
    )
    qr.add_data(destination_url)
    qr.make(fit=True)

    # Output paths
    svg_filename = f"{qr_id}.svg"
    png_filename = f"{qr_id}.png"
    
    svg_path = QR_ROOT / "qr-register" / svg_filename
    png_path = QR_ROOT / "qr-register" / png_filename
    asset_svg_path = ASSET_DIR / svg_filename

    # 2. Render SVG
    svg_img = qr.make_image(image_factory=SvgPathImage)
    svg_img.save(str(svg_path))
    svg_img.save(str(asset_svg_path))

    # 3. Render High-Res PNG (RTechLab Navy on Light Paper)
    png_img = qr.make_image(fill_color="#192446", back_color="#FDFDFE")
    png_img.save(str(png_path))

    # 4. Hash verification
    with open(svg_path, "rb") as f:
        file_hash = hashlib.sha256(f.read()).hexdigest()

    # 5. Register Entry
    entry = {
        "qr_id": qr_id,
        "chapter_id": chapter_id,
        "topic_slug": topic_slug,
        "destination_url": destination_url,
        "environment": env,
        "error_correction": "H (30% Reed-Solomon)",
        "svg_file": str(svg_path),
        "png_file": str(png_path),
        "sha256": file_hash,
        "status": "development_test" if env == "development" else "verified_production",
        "notice": "NON-PRODUCTION TEST LINK. Replace base_url with production domain once deployed."
    }

    # Update central register
    register = []
    if REGISTER_FILE.exists():
        try:
            with open(REGISTER_FILE, "r", encoding="utf-8") as f:
                register = json.load(f)
        except Exception:
            register = []

    # Update or append
    register = [r for r in register if r["qr_id"] != qr_id]
    register.append(entry)

    with open(REGISTER_FILE, "w", encoding="utf-8") as f:
        json.dump(register, f, indent=2)

    print(f"Generated QR Code [{qr_id}] -> {destination_url}")
    return entry

if __name__ == "__main__":
    # Generate sample QR codes for key topics
    generate_chapter_qr("mod-01", "hardware/silicon-cpu-sockets")
    generate_chapter_qr("mod-02", "hardware/vrm-power-delivery")
    generate_chapter_qr("mod-03", "hardware/ram-ddr4-vs-ddr5")
    generate_chapter_qr("mod-05", "hardware/psu-diagnostics-atx31")
    generate_chapter_qr("mod-07", "hardware/fault-triage-playbook")
    generate_chapter_qr("net-01", "networking/tcp-handshake")
