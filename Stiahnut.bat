@echo off

for /d %%d in ("%LOCALAPPDATA%\Fork\gitInstance\*") do set GIT=%%d\cmd\git.exe

echo === Force pull (full reset) ===

for /f "delims=" %%b in ('"%GIT%" branch --show-current') do set branch=%%b

echo Aktualna branch: %branch%

"%GIT%" fetch
if errorlevel 1 goto error

"%GIT%" reset --hard origin/%branch%
if errorlevel 1 goto error

"%GIT%" clean -fd
if errorlevel 1 goto error

echo.
echo === OK: Repo je identicke so serverom ===
pause
exit /b 0

:error
echo.
echo === CHYBA: Nieco zlyhalo ===
pause
exit /b 1