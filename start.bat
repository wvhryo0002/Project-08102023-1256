@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
setlocal enabledelayedexpansion

:: Define variables
set "blender_version=3.6.4"
set "blender_url=https://download.blender.org/release/Blender%blender_version%/blender-%blender_version%-windows-x64.zip"
set "blender_dir=C:\Program Files\Blender Foundation\Blender %blender_version%"
set "python_path=C:\Python27\Scripts"

:: Step 1: Download Blender
echo Downloading Blender %blender_version%...
curl -o blender.zip %blender_url%

:: Step 2: Install Blender
echo Installing Blender %blender_version%...
mkdir "%blender_dir%"
"C:\Program Files\7-Zip\7z.exe" x "blender.zip" -o"%blender_dir%"
:: msiexec /i "blender.zip" /qn /norestart
:: powershell -command "Expand-Archive -Path '.\blender.zip' -DestinationPath '%blender_dir%'"

:: Step 3: Install gdown
echo Installing gdown using pip...
pip install gdown

:: Define the Google Drive file URL and destination folder
set "google_drive_url=https://drive.google.com/uc?id=1annnYF8aM2lB1-jNJourh86vSY2-MGXP"
set "destination_folder=C:\Program Files\Blender Foundation\Blender 3.6.4"

:: Step 1: Download the file from Google Drive using gdown
echo Downloading file from Google Drive...
gdown "%google_drive_url%"

:: Step 2: Unzip the downloaded file using 7-Zip
echo Unzipping the downloaded file...
"C:\Program Files\7-Zip\7z.exe" x "opengl32.zip" -o"%destination_folder%"

:: Clean up: Remove the downloaded ZIP file
del "opengl32.zip"

echo File downloaded and unzipped successfully.
