::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAJATQ+DAHivFrAOpfzv/KeLo1gTV+o6arPS17WJJa4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIDPQtRXkS2CFj6KrQJ5uvz6vjn
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAJATQ+DAHivFrAOpfzv/KeLo1gTV+o6arPX26GAI+gW+AvhbZNN
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Super TTS Launcher
python --version
if not %errorlevel% == 0 (
    title Super TTS Launcher - Pythonがインストールされていません
    curl  -L -O "https://www.python.org/ftp/python/3.14.8/python-3.14.8-amd64.exe"
    echo msgbox "Pythonインストーラを開きます。「Add python.exe to PATH」へチェックを入れ、「Install Now」を選択してください。インストールできたらこのアプリをもう一度起動してください。" > %TEMP%/msgboxtest.vbs & %TEMP%/msgboxtest.vbs
    start python-3.14.8-amd64.exe & exit
)
echo Pythonは上記のバージョンがインストールされています。
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" /v Version
if errorlevel 1 (
    title Super TTS Launcher - Visual C++ Redistributableをインストールしています...
    curl -L -O "https://aka.ms/vc14/vc_redist.x64.exe"
    start vc_redist.x64.exe
)
if not exist venv (
    title Super TTS Launcher - 仮想環境を作成しています...
    python -m venv venv
)
call venv\Scripts\activate.bat
title Super TTS Launcher - パッケージを確認しています...
python -m pip install -U pip
nvidia-smi
if %errorlevel% == 0 (
    set device=cuda
) else (
    set device=cpu
)
pip install -r requirements.txt
if not exist voicevox_core (
    title Super TTS Launcher - VoiceVox Coreインストーラをダウンロードしています...
    curl  -L -O "https://github.com/VOICEVOX/voicevox_core/releases/download/0.17.1/download-windows-x64.exe"
    title Super TTS Launcher - VoiceVox Coreインストーラを実行しています...
    download-windows-x64.exe --exclude c-api --devices %device%
)
title Super LLM Launcher - WebUIを起動しています...
for /f "delims=" %%A in ('powershell -NoProfile -Command "(Get-Item 'launcher.exe').VersionInfo.FileVersion"') do set "VERSION=%%A"
python app.py