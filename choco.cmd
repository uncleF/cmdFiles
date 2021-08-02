@echo off

:: Chocolatey

choco upgrade chocolatey
choco install choco-cleaner

:: Packages

choco install ffmpeg -fy
choco install guetzli -fy
choco install imagemagick.app -fy
choco install nodejs -fy
choco install nvm -fy
choco install wget -fy

:: Apps

choco install 1password4 -fy
choco install 7zip -fy
choco install anki -fy
choco install blender -fy
choco install ccleaner -fy
choco install cyberduck -fy
choco install docker-desktop -fy
choco install dropbox -fy
choco install evernote -fy
choco install figma -fy
choco install fontforge -fy
choco install puntoswitcher -fy
choco install skype -fy
choco install slack -fy
choco install signal -fy
choco install spotify -fy
choco install steam -fy
choco install sublimetext4 -fy
choco install teamviewer -fy
choco install telegram -fy
choco install unity-hub -fy
choco install vagrant -fy
choco install virtualbox -fy
choco install vscode -fy
choco install vlc -fy
choco install wkhtmltopdf -fy
choco install winrar -fy

:: Browsers

choco install googlechrome -fy
choco install googlechrome.canary -fy
choco install chromium -fy
choco install firefox -fy
choco install firefox-nightly --pre -fy
choco install firefox-dev --pre -fy
choco install opera -fy
choco install opera-beta --pre -fy
choco install opera-developer -fy
choco install tor-browser -fy
choco install brave -fy
