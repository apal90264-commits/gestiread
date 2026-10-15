@echo off
setlocal
cd /d "%~dp0backend"
title GestiRead

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found. Install it from python.org and tick Add Python to PATH, then run this file again.
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating the Python environment - first time only...
  python -m venv .venv
  if errorlevel 1 (
    echo Could not create the Python environment.
    pause
    exit /b 1
  )
)

call ".venv\Scripts\activate.bat"

python -c "import fastapi, uvicorn, numpy, PIL, pytesseract, fitz, gtts" >nul 2>nul
if errorlevel 1 (
  echo Installing packages - first time only, this takes a few minutes...
  python -m pip install --upgrade pip
  python -m pip install -r requirements.txt
  if errorlevel 1 (
    echo.
    echo Install failed. Take a screenshot of the red text above and send it to your helper.
    pause
    exit /b 1
  )
)

if not exist "C:\Program Files\Tesseract-OCR\tesseract.exe" if not exist "C:\Program Files (x86)\Tesseract-OCR\tesseract.exe" if not exist "%LOCALAPPDATA%\Programs\Tesseract-OCR\tesseract.exe" (
  where tesseract >nul 2>nul
  if errorlevel 1 (
    echo.
    echo WARNING: Tesseract OCR was not found. Document reading will not work until you install it from
    echo https://github.com/UB-Mannheim/tesseract/wiki and run this file again.
    echo.
  )
)

echo.
echo Starting GestiRead at http://localhost:8000/translator.html
echo Keep this window open while you use the app. Close it to stop.
start "" cmd /c "timeout /t 4 /nobreak >nul & start http://localhost:8000/translator.html"
python -m uvicorn app.main:app --port 8000
pause
