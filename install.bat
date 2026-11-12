@echo off
setlocal EnableExtensions

echo [INFO] Setting up Python environment for auto-downloader...

:: 1. Verify Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found. Please install Python and add it to PATH.
    pause
    exit /b 1
)

:: 2. Create a virtual environment (optional but recommended for consistency)
:: Uncomment the following lines if you want to use a venv
:: if not exist ".venv" (
::     python -m venv .venv
:: )
:: call ".venv\Scripts\activate.bat"

:: 3. Install required dependencies
echo [INFO] Installing/updating required packages...
python -m pip install --upgrade pip >nul
python -m pip install requests json >nul

:: 4. Check for specific modules required by your code
python -c "import requests, json, ctypes, winreg, ssl" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed to import required modules. Check your Python installation.
    pause
    exit /b 1
)

:: 5. Run the main script
echo [INFO] Starting auto-downloader script...
python "%~dp0your_script_name.py"

if errorlevel 1 (
    echo [ERROR] Script execution failed.
    pause
    exit /b 1
)

echo [INFO] Script completed successfully.
pause