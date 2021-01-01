#!/bin/bash

# get current python versions
version=$(python -c 'import sys; print(sys.version_info[:])')
python_major=${version:1:1}
python_minor=${version:4:1}

# function that sets up venv virtual environment
function python_install() {
    
    if [ -d "venv" ]; then
            rm -rf venv
    fi

    python -m venv venv
    source venv/bin/activate
    python -m pip install --upgrade pip
    pip install -r requirements.txt
}

# requirements.txt was set up with python 3.9
# and it is recommended that it is used when setting
# up environment
if [[ python_major -eq 3 && python_minor -eq 9 ]] 
then
    echo "On Python 3.9 and good to install"
    python_install
else
    read -p "Expecting Python 3.9 - do you want to proceed with setup? (Y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        python_install
    fi
fi


