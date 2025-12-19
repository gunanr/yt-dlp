# Windows PowerShell YT-DLP Wrapper

## Deployment
1. Open Windows Terminal
1. Install `yt-dlp` on the Windows host
   ```powershell
   winget install yt-dlp
   ```
1. Copy all files to the host `C:\Tools\` directory
1. Create a new shortcut on the User's Desktop that points to `C:\Tools\Download-YouTube-Video.bat`
1. Set the shortcut to use the provided ico file for asthetics

## Execution
1. Double click the `YouTube-Downloader` link on the Windows Desktop.
1. Paste the URL of the YouTube video you wish to download into the Terminal window.
1. Download should run in the terminal and then open the downloads directory on completion. 
