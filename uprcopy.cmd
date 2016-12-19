:: Copy Utility

@echo off

cd %2
set original=$(git symbolic-ref --short -q HEAD)
git checkout %4 >nul 2>nul
cd ..
md %1
cd %1
md dev
xcopy %2\dev dev /s /q /y >nul 2>nul
md grunt
xcopy %2\grunt grunt /s /q /y >nul 2>nul
copy %2\gruntfile.js /y >nul 2>nul
copy %2\package.json /y >nul 2>nul
copy %2\.*.yml /y >nul 2>nul
copy %2\.*rc /y >nul 2>nul
copy %2\.editorconfig /y >nul 2>nul
copy %2\.gitattributes /y >nul 2>nul
copy %2\.gitignore /y >nul 2>nul
copy %2\%3.sublime-project .\%1.sublime-project /y >nul 2>nul
cd %2
git checkout %original% >nul 2>nul
cd ../%1