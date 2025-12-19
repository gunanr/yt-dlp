# PowerShell script to download a video using yt-dlp
# Creates a dedicated folder in the user's Downloads directory
# Downloads the best available quality to that folder

# Get the user's Downloads folder path
$downloadsPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

# Create the target directory: Downloads\yt-dlp
$targetDir = Join-Path $downloadsPath "yt-dlp"

if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
    Write-Host "Created directory: $targetDir"
} else {
    Write-Host "Using existing directory: $targetDir"
}

# Change to the target directory
Set-Location $targetDir

# Ask user for the video URL
$url = Read-Host "Enter the video URL"

Write-Host "Downloading the best available quality to $targetDir ..."

# Download best video + best audio (merges with ffmpeg if needed)
yt-dlp -f "bestvideo[vcodec^=avc1]+bestaudio[acodec^=mp4a]/best" $url

# Success message with emojis (colorful!)
Write-Host ""
Write-Host "✅ Download completed successfully! 🎉" -ForegroundColor Green
Write-Host "📁 Opening download folder..." -ForegroundColor Cyan

# Open the current folder in Windows Explorer
Invoke-Item $targetDir

# Wait 15 seconds, then close the PowerShell window
Write-Host "🕒 This window will close in 15 seconds..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

