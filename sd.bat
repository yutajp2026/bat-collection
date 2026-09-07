@echo off
if not exist venv (python -m venv venv)
call venv\Scripts\activate.bat
pip install diffusers transformers translate
pip install torch==2.12.0 torchvision==0.27.0 --index-url https://download.pytorch.org/whl/cu126
python main.py