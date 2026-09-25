::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
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
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Stable Diffusion
python --version
if not %errorlevel% == 0 (
    title Stable Diffusion - Pythonがインストールされていません
    curl  -L -O "https://www.python.org/ftp/python/3.14.7/python-3.14.7-amd64.exe"
    echo msgbox "Pythonインストーラを開きます。「Add python.exe to PATH」へチェックを入れ、「Install Now」を選択してください。インストールできたらこのアプリをもう一度起動してください。" > %TEMP%/msgboxtest.vbs & %TEMP%/msgboxtest.vbs
    start python-3.14.7-amd64.exe & exit
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" /v Version >nul 2>&1
if errorlevel 1 (
    title Stable Diffusion - Visual C++ Redistributableをインストールしています...
    curl -L -O "https://aka.ms/vc14/vc_redist.x64.exe"
    start vc_redist.x64.exe
)
if not exist venv (
    title Stable Diffusion - 仮想環境を作成しています...
    python -m venv venv
)
call venv\Scripts\activate.bat
title Stable Diffusion - pipを更新しています...
python -m pip install -U pip
title Stable Diffusion - パッケージをインストールしています...
pip install -r requirements.txt
title Stable Diffusion - WebUIを起動しています...
python main.py