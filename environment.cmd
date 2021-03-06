:: Environment Variables

@echo off

echo Setting up the Environment

D:

setx homeDirProjects D: >nul 2>nul

setx dirTemp %homeDirProjects%\Temp >nul 2>nul

setx dirCmdTools %homeDirProjects%\Projects\Tools\cmdTools >nul 2>nul

setx dirProjects %homeDirProjects%\Projects\Personal >nul 2>nul
setx dirProjectWeb %dirProjects%\TemplateX >nul 2>nul
setx dirProjectMail %dirProjects%\MailX >nul 2>nul
setx dirProjectNode %dirProjects%\AppXN >nul 2>nul
setx dirProjectCmd %dirProjects%\cmdFiles >nul 2>nul

setx remoteHome https://github.com/uncleF >nul 2>nul
setx remoteProjectWeb %remoteHome%/TemplateX.git >nul 2>nul
setx remoteProjectMail %remoteHome%/MailX.git >nul 2>nul
setx remoteProjectNode %remoteHome%/AppXN.git >nul 2>nul

setx dirBE %homeDirProjects%\Projects\BE >nul 2>nul

setx homesteadHome %homeDirProjects%\Projects\Tools\Homestead >nul 2>nul

setx buildProperties %dirProjects%\antBuild.properties >nul 2>nul
setx buildJSON %dirProjects%\gruntBuild.json >nul 2>nul

setx dirHG %homeDirProjects%\Projects\HGStudio >nul 2>nul
setx dirRuPort %homeDirProjects%\Projects\RuPort >nul 2>nul
setx dirYazoo %homeDirProjects%\Projects\yazoo >nul 2>nul

setx PATH "%PATH%;%homeDirProjects%%dirCmdTools%"

:: Setting Up CLI

rmdir %dirCmdTools% >nul 2>nul
mkdir %dirCmdTools% >nul 2>nul
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:exclude.txt /y >nul 2>nul
xcopy %dirProjectCmd%\replaceText.vbs %dirCmdTools%\ /y >nul 2>nul
xcopy %dirProjectCmd%\gruntBuild.json %dirProjects%\ /y >nul 2>nul
xcopy %dirProjectCmd%\antBuild.properties %dirProjects%\ /y >nul 2>nul
