@echo off

:: Chocolatey

choco upgrade chocolatey
choco install choco-cleaner

:: Homebrew Packages

choco install ffmpeg
choco install guetzli
choco install imagemagick.app
choco install nodejs
choco install nvm
choco install wget

:: Apps

choco install 1password4
choco install anki
choco install blender
choco install ccleaner
choco install cyberduck
choco install docker-desktop
choco install dropbox
choco install evernote
choco install figma
choco install f.lux
choco install fontforge
choco install licecap
choco install puntoswitcher
choco install skype
choco install slack
choco install signal
choco install spotify
choco install steam
choco install sublimetext3
choco install teamviewer
choco install telegram
choco install vagrant
choco install virtualbox
choco install vscode
choco install vlc
choco install wkhtmltopdf

:: Browsers

choco install googlechrome
choco install googlechrome.canary
choco install chromium
choco install firefox
choco install firefox-nightly --pre
choco install firefox-dev --pre
choco install opera
choco install opera-beta --pre
choco install opera-developer
choco install tor-browser
choco install brave
