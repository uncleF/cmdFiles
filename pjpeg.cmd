:: Convert JPEGs to progressive JPEGs

@echo off
setlocal

for %%i in (*.jpg) do (
	convert -strip -interlace Plane -quality 75 %i% %i%;
)

endlocal