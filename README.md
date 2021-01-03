# data-processing

Repo for data processing code.

## Environment setup

* Create a `.exports` file that you source into a `.bashrc` or `.zshrc` file.  This will allow securely managing all project related secrets locally as well as support reproducibility.
* Install docker - see here for instructions [docker setup](https://docs.docker.com/get-docker/)
* Install [mssql-tools](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-ver15)
* Install Python `3.9.*`.  Suggest using `pyenv`, see below for suggested set up.
* Set up Python environment using [setup_venv.sh](setup_venv.sh)

## Suggested Tools

* [direnv](https://direnv.net/) is a great tool for managing virtual environments via the command line.  When you set up a `.envrc` file, when you `cd` into that directory, it will automatically execute which can be helpful in loading environment variables as well as loading a python environment.
* [cyberduck](https://cyberduck.io/) is a good GUI utility for accessing files from SFTP and BLOB storage services like AWS S3.
* [python venv](https://docs.python.org/3/tutorial/venv.html) is a light-weight virtual enviroment tool supported directly within python.
* [VS Code](https://code.visualstudio.com/) is a useful text editor that comes with an extensive list of extensions that allow it to support python development, data science, and data engineering.
  * [Jupyter Notebooks in VS Code](https://code.visualstudio.com/docs/python/jupyter-support) Supports running jupyer notebooks directly in VS Code.
* [pyenv](https://github.com/pyenv/pyenv) is a utility that supports installing and managing multipel versions of python.  To use this, you will need to first add the following to your `.zshrc` or `.bashrc` file.  You can then run [setup_python.sh](setup_python.sh) to install python `3.9.0`.

        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        if command -v pyenv 1>/dev/null 2>&1; then
            eval "$(pyenv init -)"
        fi
* [homebrew](https://brew.sh/) is a greater method for installing and managing packages and applications on MacOS, Linux, or Windows Subsystem for Linux.
