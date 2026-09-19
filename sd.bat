@echo off
title Stable Diffusion
python --version
if not %errorlevel% == 0 (
    title Stable Diffusion - Pythonがインストールされていません
    curl  -L -O "https://www.python.org/ftp/python/3.14.7/python-3.14.7-amd64.exe"
    echo msgbox "Pythonインストーラを開きます。「Add python.exe to PATH」へチェックを入れ、「Install Now」を選択してください。インストールできたらこのアプリをもう一度起動してください。" > %TEMP%/msgboxtest.vbs & %TEMP%/msgboxtest.vbs
    start python-3.14.7-amd64.exe & exit
)
if not exist venv (
    title Stable Diffusion - 仮想環境を作成しています...
    python -m venv venv
)
call venv\Scripts\activate.bat
title Stable Diffusion - pipを更新しています...
python -m pip install -U pip
title Stable Diffusion - パッケージをインストールしています(diffusers, transformers, translate, gradio)...
pip install diffusers transformers translate gradio
title Stable Diffusion - パッケージをインストールしています(torch, torchvision)...
pip install torch==2.12.0 torchvision==0.27.0 --index-url https://download.pytorch.org/whl/cu126
title Stable Diffusion - WebUIを起動しています...
python main.py