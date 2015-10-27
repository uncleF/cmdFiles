::Environment Variables
setx homeDirProjects D:
setx dirProjects %homeDirProjects%\Projects\Projects
setx dirCmdTools %homeDirProjects%\Projects\Tools\cmdTools
setx dirTemp %homeDirProjects%\Temp
setx dirProjectWeb %dirProjects%\TemplateX
setx dirProjectApp %dirProjects%\AppX
setx dirProjectMail %dirProjects%\MailX
setx dirProjectCmd %dirProjects%\cmdFiles
setx remoteHome https://github.com/uncleF
setx remoteProjectWeb %remoteHome%/TemplateX.git
setx remoteProjectApp %remoteHome%/AppX.git
setx remoteProjectMail %remoteHome%/MailX.git
setx buildProperties %dirProjects%\antBuild.properties
setx buildJSON %dirProjects%\gruntBuild.json

::Setting Up CLI
rmdir %dirCmdTools%
mkdir %dirCmdTools%
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:exclude.txt /y
xcopy %dirProjectCmd%\replaceText.vbs %dirCmdTools%\ /y
xcopy %dirProjectCmd%\gruntBuild.json %dirProjects%\ /y
xcopy %dirProjectCmd%\antBuild.properties %dirProjects%\ /y
