:: Open Current Project in Sublime Text

@echo off
setlocal

if exist *.sublime-project (
  subl --project *.sublime-project
) else (
  subl ./
)

endlocal