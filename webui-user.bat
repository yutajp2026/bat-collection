::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAJATQ+DAHiuB7cQ7aX/5uyBt14UW+xyb4rZz72yLO8U5QvtdplN
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
::Zh4grVQjdCyDJGyX8VAjFAJATQ+DAHiuB7cQ7aX/5uyBt14UW+xyb4rZz72yN+UR/0ypYIUoxDRfgM5s
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Stable Diffusion WebUI
set PYTHON="C:\Users\%username%\AppData\Local\Programs\Python\Python310\python.exe"
set STABLE_DIFFUSION_REPO=https://github.com/w-e-w/stablediffusion.git

nvidia-smi
if %ERRORLEVEL% NEQ 0 (
    set COMMANDLINE_ARGS=--use-cpu all --precision full --no-half --skip-torch-cuda-test
) else (
    set COMMANDLINE_ARGS=--xformers
)

git config --global --add safe.directory %~dp0\repositories\*
if %ERRORLEVEL% NEQ 0 (
    winget install --id Git.Git -e --source winget
    echo Git���C���X�g�[�����܂����B������x���̃A�v�����N������K�v�����邩������܂���B
)

call webui.bat
