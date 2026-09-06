@echo off
if not exist venv (python -m venv venv)
call venv\Scripts\activate.bat
pip install diffusers transformers translate
pip install torch torchvision
python main.py