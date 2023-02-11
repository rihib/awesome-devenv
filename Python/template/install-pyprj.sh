#!/bin/bash

# 変数
PRJ_ROOT_PATH="/home/ubuntu/environment/tmp"
PRJ_ROOT="TMP_ROOT"
YOUR_USER_NAME="rihib"
YOUR_USER_EMAIL="rihib@rihib.dev"
HOME="/home/ubuntu"
YOUR_GITHUB_REPOSITORY_URL="https://github.com/rihib/tmp.git"
ANYENV_VERSION="v1.1.5"
PYENV_VERSION="v2.3.12"
PYTHON_VERSION="3.11.1"
POETRY_VERSION="1.3.2"
YOUR_PRJ_NAME="tmp"
DESCRIPTION="description"
AUTHOR="rihib <rihib@rihib.dev>"

# マーカーを挿入
echo -e "\n\n# begin awesome-pydevenv\n" >> ~/.bashrc
echo -e "\n\n# begin awesome-pydevenv\n" >> ~/.bash_profile
echo -e "\n\n# begin awesome-pydevenv\n" >> ~/.profile

# 環境変数`<PRJ_NAME>_ROOT`を作成
echo "export ${PRJ_ROOT}=${PRJ_ROOT_PATH}" >> ~/.bashrc
echo "export ${PRJ_ROOT}=${PRJ_ROOT_PATH}" >> ~/.bash_profile
echo "export ${PRJ_ROOT}=${PRJ_ROOT_PATH}" >> ~/.profile
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
echo -e "\n\n\n${PRJ_ROOT} was set successfully.\n\n\n"

# Gitの設定
git config --global user.name ${YOUR_USER_NAME}
git config --global user.email ${YOUR_USER_EMAIL}
echo -e "\n\n\nGit was configured successfully.\n\n\n"

# プロジェクトルートディレクトリの作成
mkdir -p ${PRJ_ROOT_PATH}
git clone ${YOUR_GITHUB_REPOSITORY_URL} ${PRJ_ROOT_PATH}
echo -e "\n\n\nProject root directory was created successfully.\n\n\n"

# anyenvのインストール
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="${HOME}/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="${HOME}/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="${HOME}/.anyenv/bin:$PATH"' >> ~/.profile
~/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
echo y | anyenv install --init
pushd $(anyenv root)
git checkout ${ANYENV_VERSION}
popd
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
echo -e "\n\n\nanyenv was installed successfully.\n\n\n"

# pyenvとPythonのインストール
anyenv install pyenv
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
pushd $(pyenv root)
git checkout ${PYENV_VERSION}
popd
pyenv install ${PYTHON_VERSION}
pyenv rehash
pyenv global ${PYTHON_VERSION}
echo -e "\n\n\npyenv and Python were installed successfully.\n\n\n"

# Poetryのインストールと初期化
curl -sSL https://install.python-poetry.org | POETRY_HOME=${HOME}/.poetry POETRY_VERSION=${POETRY_VERSION} python3 -
echo 'export PATH=${HOME}/.poetry/bin:$PATH' >> ~/.bashrc
echo 'export PATH=${HOME}/.poetry/bin:$PATH' >> ~/.bash_profile
echo 'export PATH=${HOME}/.poetry/bin:$PATH' >> ~/.profile
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
cd ${PRJ_ROOT_PATH}
pyenv local ${PYTHON_VERSION}
python -m venv .venv
poetry install
echo -e "\n\n\nPoetry was installed and project directory was initialized successfully.\n\n\n"

# マーカーを挿入
echo -e "\n# end awesome-pydevenv\n" >> ~/.bashrc
echo -e "\n# end awesome-pydevenv\n" >> ~/.bash_profile
echo -e "\n# end awesome-pydevenv\n" >> ~/.profile

# 仮想環境を立ち上げる
poetry shell

# 完了メッセージを表示
echo -e "\n\n\nCompleted!!\n\n\n"
