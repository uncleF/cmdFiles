@echo off

:: Chocolatey

choco upgrade chocolatey
choco install choco-cleaner

:: Packages

choco install ffmpeg -fy
choco install fzf -fy
choco install guetzli -fy
choco install imagemagick.app -fy
choco install git -fy
choco install nodejs -fy
choco install nvm -fy
choco install wget -fy

:: Apps

choco install 7zip -fy
choco install aceprite -fy
choco install anki -fy
choco install blender -fy
choco install ccleaner -fy
choco install cyberduck -fy
choco install discord -fy
choco install docker-desktop -fy
choco install dropbox -fy
choco install epicgameslauncher -fy
choco install evernote -fy
choco install figma -fy
choco install fontforge -fy
choco install googledrive -fy
choco install inkscape -fy
choco install itunes -fy
choco install krita -fy
choco install make -fy
choco install notion -fy
choco install pia -fy
choco install potplayer -fy
choco install puntoswitcher -fy
choco install qbittorrent -fy
choco install renamer -fy
choco install revo-uninstaller -fy
choco install skype -fy
choco install slack -fy
choco install signal -fy
choco install spotify -fy
choco install steam -fy
choco install sublimetext4 -fy
choco install teamviewer -fy
choco install telegram -fy
choco install thunderbird -fy
choco install toggl -fy
choco install unity-hub -fy
choco install virtualbox -fy
choco install vscode -fy
choco install vlc -fy
choco install whatsapp -fy
choco install winrar -fy
choco install wkhtmltopdf -fy
choco install zoom -fy

:: Browsers

choco install googlechrome -fy
choco install chromium -fy
choco install firefox -fy
choco install firefox-nightly --pre -fy
choco install firefox-dev --pre -fy
choco install opera -fy
choco install opera-beta --pre -fy
choco install opera-developer -fy
choco install tor-browser -fy
choco install brave -fy

echo "Also install: 1Password, ApexDC++, Aseprite, CDispay, Chrome Canary, Cmder, Defold, Figma, Rive, Spine, TickTick, TOR"
pause