@echo off

for /d %%d in ("%LOCALAPPDATA%\Fork\gitInstance\*") do set GIT=%%d\cmd\git.exe

echo === Git auto push ===

"%GIT%" add .
if errorlevel 1 goto error

"%GIT%" commit -m "auto commit"
if errorlevel 1 goto error

"%GIT%" push
if errorlevel 1 goto error

echo.
echo === OK: Vsetko sa pushlo ===
pause
exit /b 0

:error
echo.
echo === CHYBA: Nieco zlyhalo ===
pause
exit /b 1