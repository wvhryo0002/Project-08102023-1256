@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
setlocal enabledelayedexpansion

:: Download Blender
curl -o "blender.msi" "https://mirrors.ocf.berkeley.edu/blender/release/Blender3.6/blender-3.6.4-windows-x64.msi"
msiexec /i blender.msi /qn /norestart

:: Define the Google Drive file URL and destination folder
set "google_drive_url=https://drive.google.com/uc?id=1annnYF8aM2lB1-jNJourh86vSY2-MGXP"
set "destination_folder=C:\Program Files\Blender Foundation\Blender 3.6"
pip install gdown
gdown "%google_drive_url%"
"C:\Program Files\7-Zip\7z.exe" x "opengl32.zip" -o"%destination_folder%"

:: Download File
gdown -O "c:\Users\Public\Desktop\123.blend" "1P9Cv_rxaA_bWbvpJOSf5UpOQJkclry_Z"

:: Clean up: Remove the downloaded ZIP file
del "opengl32.zip"
