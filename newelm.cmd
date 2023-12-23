:: Create New TX-element

@echo off
setlocal

if exist dev (
  goto options
) else (
  goto errorDirectory
)

:errorDirectory
  echo Nothing To Watch
  goto exit

:options
  set name=element
  set html=false
  set sass=false
  set js=false

  if [%1]==[-a] (
    set html=true
    set sass=true
    set js=true
  )
  if [%1]==[-h] (
    set html=true
  )
  if [%1]==[-s] (
    set sass=true
  )
  if [%1]==[-j] (
    set js=true
  )
  if [%1]==[-n] if NOT [%2]==[] if NOT [%2]==[-a] if NOT [%2]==[-h] if NOT [%2]==[-s] if NOT [%2]==[-j] (
    set name=%2
    shift
  )
  shift
  goto newElement

:newElement
  if %html%==true (
    call type nul > .\dev\res\templates\components\_%name%.html
  )
  if %sass%==true (
    call type nul > .\dev\res\sass\components\_%name%.scss
  )
  if %js%==true (
    call type nul > .\dev\res\js-dev\components\%name%.js
  )

:exit

endlocal