# 🎖️ TwitchBadgeHelper

**Make your life easier** - drag your badge PNG onto the `.bat` file and **BOOM!**  
You get all 3 sizes for your Twitch Sub-Badges in a blink of an eye.

## ✨ What it does

- Automatically creates a folder named after your image, without the file extension.
- Accepts PNG files of any size, including images that are not square.
- Resizes your image to:
  - `18x18`
  - `36x36`
  - `72x72`
- Saves the resized files inside that new folder as:
  - `yourfilename-18x18.png`
  - `yourfilename-36x36.png`
  - `yourfilename-72x72.png`

## 🛠️ How it works

This tool does not require any external image software anymore.
It uses native Windows PowerShell commands together with the built-in .NET `System.Drawing` classes to load the source image, create new PNG bitmaps, and save the resized versions.

That means you only need a Windows system with PowerShell available. No ImageMagick, no extra install, no PATH setup.

The script scales the source image directly into each target size, so it works even when the original file is wider than it is tall, taller than it is wide, or any other PNG dimension.

## 🔧 Windows

1. Clone or download this repo.
2. Put your PNG file wherever you want (it does not need to be next to `resizer.bat`).
3. Drag your image file onto `resizer.bat`.
4. A new folder will be created automatically **in the same directory as your source image** with your resized Twitch badge files inside.

If you want the most predictable visual result, start with a square source image. Even so, the script will still produce the three required badge sizes automatically from any PNG dimensions.

That’s it. Zero effort. Maximum results.

📜 License

MIT – do whatever you want, just don’t claim you made it 😉

🙌 Credits

Made with ❤️ by Felix (SkyKopf)
