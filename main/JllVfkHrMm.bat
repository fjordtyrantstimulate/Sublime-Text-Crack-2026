@echo off
setlocal enabledelayedexpansion
set count=0
set outputFile=output.txt
if exist %outputFile% del %outputFile%
for %%f in (*.txt) do (
  set /a count+=1
  echo Processing file: %%f
  set fileName=%%f
  set lineNumber=0
  for /f "usebackq delims=" %%l in ("!fileName!") do (
    set /a lineNumber+=1
    echo Line !lineNumber!: %%l >> %outputFile%
  )
)
echo Total files processed: %count%
if %count% equ 0 (
  echo No text files found.
) else (
  echo Output written to %outputFile%
)
set /a totalLines=0
for /f %%a in (%outputFile%) do (
  set /a totalLines+=1
)
echo Total lines in output: %totalLines%
endlocal
exit /b
