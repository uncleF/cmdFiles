:: Open Current Project in Sublime Text

@echo off

if exist *.sublime-project (
  subl --project *.sublime-project
) else (
  subl ./
)
