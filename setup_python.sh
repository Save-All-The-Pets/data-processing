#!/bin/bash

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

# ## Install pyenv
PYTHON_VERSION="3.9.0"

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION