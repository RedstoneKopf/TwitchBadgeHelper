REM Copyright (c) 2025 Felix Kramer, licensed under MIT.
REM Check out the GitHub Repo for more information:
REM https://github.com/Felix-Skytro/TwitchBadgeHelper

@echo off
setlocal

:: Check if a file was dragged onto the script
set "filepath=%~1"
if "%filepath%"=="" (
    echo Please drag and drop an image file onto this script.
    pause
    exit /b
)

:: Get the full path and filename
set "filename=%~n1"
set "folderpath=%~dp1%filename%"

:: Create folder
mkdir "%folderpath%" 2>nul

echo Creating Twitch Badges for: %filename% ...

:: Call PowerShell to resize images via .NET (System.Drawing)
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Add-Type -AssemblyName System.Drawing; " ^
  "$srcPath = '%filepath%'; " ^
  "$destFolder = '%folderpath%'; " ^
  "$baseName = '%filename%'; " ^
  "$sizes = @(18, 36, 72); " ^
  "try { $img = [System.Drawing.Image]::FromFile($srcPath); } catch { Write-Host 'Error loading image.'; exit; } " ^
  "foreach ($size in $sizes) { " ^
  "    $destPath = Join-Path $destFolder ($baseName + '-' + $size + 'x' + $size + '.png'); " ^
  "    $bmp = New-Object System.Drawing.Bitmap($size, $size); " ^
  "    $g = [System.Drawing.Graphics]::FromImage($bmp); " ^
  "    $g.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy; " ^
  "    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic; " ^
  "    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality; " ^
  "    $g.DrawImage($img, 0, 0, $size, $size); " ^
  "    $g.Dispose(); " ^
  "    $bmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png); " ^
  "    $bmp.Dispose(); " ^
  "    Write-Host ('-> ' + $size + 'x' + $size + ' created.'); " ^
  "} " ^
  "$img.Dispose();"

echo.
echo Process completed!
timeout /t 3 >nul