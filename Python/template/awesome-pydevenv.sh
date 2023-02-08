#!/bin/bash

# 変数
PRJ_ROOT_PATH="<PRJ_ROOT_PATH>"
PRJ_ROOT="<PRJ_NAME>_ROOT"
YOUR_USER_NAME="<YOUR_USER_NAME>"
YOUR_USER_EMAIL="<YOUR_USER_EMAIL>"
YOUR_GITHUB_REPOSITORY_URL="<YOUR_GITHUB_REPOSITORY_URL>"
ANYENV_VERSION="v1.1.5"
PYENV_VERSION="v2.3.12"
PYTHON_VERSION="3.11.1"
POETRY_VERSION="1.3.2"
YOUR_PRJ_NAME="<YOUR_PRJ_NAME>"
DESCRIPTION="<DESCRIPTION>"
AUTHOR="NAME <EMAIL>"
PYPROJECT_TOML='
[tool.isort]
profile = "black"
import_heading_stdlib = "Stdlib"
import_heading_firstparty = "First Party"
import_heading_thirdparty = "Third Party"
import_heading_localfolder = "Local"

[tool.mypy]
disallow_untyped_defs = true
ignore_missing_imports = true
no_implicit_optional = true
show_error_context = true
show_column_numbers = true
warn_return_any = true
warn_unused_ignores = true
warn_redundant_casts = true
'
SETTINGS_JSON='
{
    // Project
    // General
    "recommendations": [
        // CSV, TSV
        "mechatroner.rainbow-csv",
        // Docker
        "ms-azuretools.vscode-docker",
        // General
        "christian-kohler.path-intellisense",
        "emilast.logfilehighligh",
        "ibm.output-colorizer",
        "ms-ceintl.vscode-language-pack-ja",
        "ms-vscode-remote.vscode-remote-extensionpack",
        "ms-vsliveshare.vsliveshare",
        "oderwat.indent-rainbow",
        "pkief.material-icon-theme",
        "ritwickdey.liveserver",
        "shardulm94.trailing-spaces",
        "streetsidesoftware.code-spell-checker",
        "usernamehw.errorlens",
        "gruntfuggly.todo-tree",
        "mosapride.zenkaku",
        // Git
        "eamodio.gitlens",
        "mhutchie.git-graph",
        // GitHub
        "github.vscode-pull-request-github",
        // HTML, XML
        "formulahendry.auto-complete-tag",
        // Markdown
        "davidanson.vscode-markdownlint",
        "shd101wyy.markdown-preview-enhanced",
        "yzhang.markdown-all-in-one",
        // Prettier
        "esbenp.prettier-vscode",
        // Python
        "ms-python.python",
        "njpwerner.autodocstring",
        "tamasfe.even-better-toml",
        // YAML
        "redhat.vscode-yaml",
    ],
    "remote.SSH.defaultExtensions": [
        // CSV, TSV
        "mechatroner.rainbow-csv",
        // Docker
        "ms-azuretools.vscode-docker",
        // General
        "christian-kohler.path-intellisense",
        "emilast.logfilehighligh",
        "ibm.output-colorizer",
        "ms-ceintl.vscode-language-pack-ja",
        "ms-vscode-remote.vscode-remote-extensionpack",
        "ms-vsliveshare.vsliveshare",
        "oderwat.indent-rainbow",
        "pkief.material-icon-theme",
        "ritwickdey.liveserver",
        "shardulm94.trailing-spaces",
        "streetsidesoftware.code-spell-checker",
        "usernamehw.errorlens",
        "gruntfuggly.todo-tree",
        "mosapride.zenkaku",
        // Git
        "eamodio.gitlens",
        "mhutchie.git-graph",
        // GitHub
        "github.vscode-pull-request-github",
        // HTML, XML
        "formulahendry.auto-complete-tag",
        // Markdown
        "davidanson.vscode-markdownlint",
        "shd101wyy.markdown-preview-enhanced",
        "yzhang.markdown-all-in-one",
        // Prettier
        "esbenp.prettier-vscode",
        // Python
        "ms-python.python",
        "njpwerner.autodocstring",
        "tamasfe.even-better-toml",
        // YAML
        "redhat.vscode-yaml",
    ],
    "dev.containers.defaultExtensions": [
        // CSV, TSV
        "mechatroner.rainbow-csv",
        // Docker
        "ms-azuretools.vscode-docker",
        // General
        "christian-kohler.path-intellisense",
        "emilast.logfilehighligh",
        "ibm.output-colorizer",
        "ms-ceintl.vscode-language-pack-ja",
        "ms-vscode-remote.vscode-remote-extensionpack",
        "ms-vsliveshare.vsliveshare",
        "oderwat.indent-rainbow",
        "pkief.material-icon-theme",
        "ritwickdey.liveserver",
        "shardulm94.trailing-spaces",
        "streetsidesoftware.code-spell-checker",
        "usernamehw.errorlens",
        "gruntfuggly.todo-tree",
        "mosapride.zenkaku",
        // Git
        "eamodio.gitlens",
        "mhutchie.git-graph",
        // GitHub
        "github.vscode-pull-request-github",
        // HTML, XML
        "formulahendry.auto-complete-tag",
        // Markdown
        "davidanson.vscode-markdownlint",
        "shd101wyy.markdown-preview-enhanced",
        "yzhang.markdown-all-in-one",
        // Prettier
        "esbenp.prettier-vscode",
        // Python
        "ms-python.python",
        "njpwerner.autodocstring",
        "tamasfe.even-better-toml",
        // YAML
        "redhat.vscode-yaml",
    ],
    "liveServer.settings.donotVerifyTags": true,
    "files.autoGuessEncoding": true,
    "editor.codeActionsOnSave": {
        "source.organizeImports": true,
    },
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "files.insertFinalNewline": true,
    "cSpell.ignoreWords": [
        // アルファベット順
        "autodocstring",
        "azuretools",
        "ceintl",
        "davidanson",
        "donot",
        "eamodio",
        "errorlens",
        "esbenp",
        "extensionpack",
        "firstparty",
        "isort",
        "kohler",
        "liveserver",
        "localfolder",
        "mypy",
        "mechatroner",
        "mhutchie",
        "njpwerner",
        "oderwat",
        "pkief",
        "pyproject",
        "ritwickdey",
        "shardulm",
        "stdlib",
        "thirdparty",
        "usernamehw",
        "yzhang",
    ],
    // Markdown
    "markdownlint.config": {
        "MD033": false,
    },
    // Prettier
    "prettier.tabWidth": 4,
    "prettier.useTabs": true,
    // Python
    "python.analysis.autoImportCompletions": true,
    "python.analysis.autoImportUserSymbols": true,
    "python.analysis.completeFunctionParens": true,
    "python.analysis.extraPaths": [
		"${workspaceFolder}/.venv/lib/python*/site-packages/",
	],
    "python.analysis.inlayHints.functionReturnTypes": true,
    "python.analysis.inlayHints.variableTypes": true,
    "python.analysis.typeCheckingMode": "strict",
    "python.autoComplete.extraPaths": [
		"${workspaceFolder}/.venv/lib/python*/site-packages/",
	],
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
    "python.formatting.provider": "black",
    "python.formatting.blackPath": "${workspaceFolder}/.venv/bin/black",
    "python.linting.flake8Enabled": true,
    "python.linting.flake8Path": "${workspaceFolder}/.venv/bin/flake8",
    "python.linting.flake8Args": [
        "--max-line-length=88",
        "--extend-ignore=E203",
    ],
    "python.linting.mypyEnabled": true,
    "python.linting.mypyPath": "${workspaceFolder}/.venv/bin/mypy",
    "python.linting.banditEnabled": true,
    "python.linting.banditPath": "${workspaceFolder}/.venv/bin/bandit",
    "isort.check": true,
    "isort.showNotifications": "onWarning",
    "isort.path": [
		"${workspaceFolder}/.venv/bin/isort"
	],
}
'

# 環境変数`<PRJ_NAME>_ROOT`を作成
echo "export =$PRJ_ROOT_PATH" >> ~/.bashrc
echo "export $PRJ_ROOT=$PRJ_ROOT_PATH" >> ~/.bash_profile
echo "export $PRJ_ROOT=$PRJ_ROOT_PATH" >> ~/.profile
exec ${SHELL}
echo "$PRJ_ROOT was set successfully."

# Gitの設定
git config --global user.name $YOUR_USER_NAME
git config --global user.email $YOUR_USER_EMAIL
git config --global core.editor vim
echo "Git was configured successfully."

# プロジェクトルートディレクトリの作成
mkdir -p ${$PRJ_ROOT}
echo "Yayyyyyyyyyyyyyyyyyyyyyyyyyyyyy!!!!!!!!!!!"
git clone $YOUR_GITHUB_REPOSITORY_URL ${$PRJ_ROOT}
echo "Project root directory was created successfully."

# anyenvのインストール
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
~/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
exec ${SHELL}
echo y | anyenv install --init
pushd $(anyenv root)
git checkout $ANYENV_VERSION
popd
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
echo "anyenv was installed successfully."

# pyenvとPythonのインストール
anyenv install pyenv
exec ${SHELL} -l
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile
exec ${SHELL}
pushd $(pyenv root)
git checkout $PYENV_VERSION
popd
pyenv install $PYTHON_VERSION
pyenv rehash
pyenv global $PYTHON_VERSION
echo "pyenv and Python were installed successfully."

# Poetryのインストールと初期化
curl -sSL https://install.python-poetry.org | POETRY_HOME=${HOME}/.poetry POETRY_VERSION=$POETRY_VERSION python3 -
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bashrc
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bash_profile
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.profile
exec ${SHELL}
cd ${$PRJ_ROOT}
pyenv local $PYTHON_VERSION
python -m venv .venv
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.prefer-active-python true --local
poetry init --no-interaction --name "$YOUR_PRJ_NAME" --description "$DESCRIPTION" --author "$AUTHOR" --python $PYTHON_VERSION
echo $PYPROJECT_TOML >> $PRJ_ROOT/pyproject.toml
poetry install
echo "Poetry was installed and project directory was initialized successfully."

# リンター・フォーマッターをインストールする
poetry add --group dev bandit black flake8 isort mypy
echo "Linters and formatters were installed successfully."

# VSCodeの設定
mkdir $PRJ_ROOT/.vscode
touch $PRJ_ROOT/.vscode/settings.json
echo $SETTINGS_JSON >> $PRJ_ROOT/.vscode/settings.json
echo "VSCode was configured successfully."

# 必要なディレクトリとファイルを作成する
mkdir $PRJ_ROOT/src
touch $PRJ_ROOT/src/__init__.py
mkdir $PRJ_ROOT/tests
touch $PRJ_ROOT/tests/__init__.py
echo "Directories and files were created successfully."

# GitHubリポジトリにpushする
git add -A
git commit -m "プロジェクトを作成"
git push
echo "Successfully pushed to GitHub."

echo "Completed!!"
