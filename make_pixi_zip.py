from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

script_dir = Path(__file__).resolve().parent
output_dir = script_dir / "_site"
output_path = output_dir / "spatial-data-science.zip"
files = (script_dir / "pixi.toml", script_dir / "pixi.lock")

output_dir.mkdir(parents=True, exist_ok=True)

with ZipFile(output_path, "w", compression=ZIP_DEFLATED) as archive:
    for file in files:
        archive.write(file, arcname=file.name)

print(f"Created {output_path}")