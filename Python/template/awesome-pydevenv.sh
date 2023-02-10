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
PYPROJECT_TOML='
\n
[tool.isort]\n
profile = "black"\n
import_heading_stdlib = "Stdlib"\n
import_heading_firstparty = "First Party"\n
import_heading_thirdparty = "Third Party"\n
import_heading_localfolder = "Local"\n
\n
[tool.mypy]\n
disallow_untyped_defs = true\n
ignore_missing_imports = true\n
no_implicit_optional = true\n
show_error_context = true\n
show_column_numbers = true\n
warn_return_any = true\n
warn_unused_ignores = true\n
warn_redundant_casts = true\n
'
SETTINGS_JSON='
{\n
    // Personal\n
    "workbench.colorTheme": "Default Light+",\n
    "workbench.startupEditor": "none",\n
    "explorer.confirmDragAndDrop": false,\n
    "explorer.confirmDelete": false,\n
    "terminal.integrated.enableMultiLinePasteWarning": false,\n
    "security.workspace.trust.untrustedFiles": "open",\n
    "workbench.iconTheme": "material-icon-theme",\n
    "editor.autoIndent": "advanced",\n
    "editor.fontSize": 14,\n
    "material-icon-theme.activeIconPack": "react",\n
    "window.zoomLevel": 1,\n
    "vscode-pets.theme": "beach",\n
    "vscode-pets.throwBallWithMouse": true,\n
    "vscode-pets.petSize": "medium",\n
    "powermode.enabled": true,\n
    "powermode.presets": "fireworks",\n
    "powermode.combo.counterEnabled": "show",\n
    "powermode.shake.enabled": false,\n
    "powermode.combo.timeout": 1,\n
    // Project\n
    // General\n
    "recommendations": [\n
        // CSV, TSV\n
        "mechatroner.rainbow-csv",\n
        // Docker\n
        "ms-azuretools.vscode-docker",\n
        // General\n
        "christian-kohler.path-intellisense",\n
        "emilast.logfilehighligh",\n
        "ibm.output-colorizer",\n
        "ms-ceintl.vscode-language-pack-ja",\n
        "ms-vscode-remote.vscode-remote-extensionpack",\n
        "ms-vsliveshare.vsliveshare",\n
        "oderwat.indent-rainbow",\n
        "pkief.material-icon-theme",\n
        "ritwickdey.liveserver",\n
        "shardulm94.trailing-spaces",\n
        "streetsidesoftware.code-spell-checker",\n
        "usernamehw.errorlens",\n
        "gruntfuggly.todo-tree",\n
        "mosapride.zenkaku",\n
        // Git\n
        "eamodio.gitlens",\n
        "mhutchie.git-graph",\n
        // GitHub\n
        "github.vscode-pull-request-github",\n
        // HTML, XML\n
        "formulahendry.auto-complete-tag",\n
        // Markdown\n
        "davidanson.vscode-markdownlint",\n
        "shd101wyy.markdown-preview-enhanced",\n
        "yzhang.markdown-all-in-one",\n
        // Personal\n
        "hoovercj.vscode-power-mode",\n
        "tonybaloney.vscode-pets",\n
        // Prettier\n
        "esbenp.prettier-vscode",\n
        // Python\n
        "ms-python.python",\n
        "njpwerner.autodocstring",\n
        "tamasfe.even-better-toml",\n
        // YAML\n
        "redhat.vscode-yaml",\n
    ],\n
    "remote.SSH.defaultExtensions": [\n
        // CSV, TSV\n
        "mechatroner.rainbow-csv",\n
        // Docker\n
        "ms-azuretools.vscode-docker",\n
        // General\n
        "christian-kohler.path-intellisense",\n
        "emilast.logfilehighligh",\n
        "ibm.output-colorizer",\n
        "ms-ceintl.vscode-language-pack-ja",\n
        "ms-vscode-remote.vscode-remote-extensionpack",\n
        "ms-vsliveshare.vsliveshare",\n
        "oderwat.indent-rainbow",\n
        "pkief.material-icon-theme",\n
        "ritwickdey.liveserver",\n
        "shardulm94.trailing-spaces",\n
        "streetsidesoftware.code-spell-checker",\n
        "usernamehw.errorlens",\n
        "gruntfuggly.todo-tree",\n
        "mosapride.zenkaku",\n
        // Git\n
        "eamodio.gitlens",\n
        "mhutchie.git-graph",\n
        // GitHub\n
        "github.vscode-pull-request-github",\n
        // HTML, XML\n
        "formulahendry.auto-complete-tag",\n
        // Markdown\n
        "davidanson.vscode-markdownlint",\n
        "shd101wyy.markdown-preview-enhanced",\n
        "yzhang.markdown-all-in-one",\n
        // Personal\n
        "hoovercj.vscode-power-mode",\n
        "tonybaloney.vscode-pets",\n
        // Prettier\n
        "esbenp.prettier-vscode",\n
        // Python\n
        "ms-python.python",\n
        "njpwerner.autodocstring",\n
        "tamasfe.even-better-toml",\n
        // YAML\n
        "redhat.vscode-yaml",\n
    ],\n
    "dev.containers.defaultExtensions": [\n
        // CSV, TSV\n
        "mechatroner.rainbow-csv",\n
        // Docker\n
        "ms-azuretools.vscode-docker",\n
        // General\n
        "christian-kohler.path-intellisense",\n
        "emilast.logfilehighligh",\n
        "ibm.output-colorizer",\n
        "ms-ceintl.vscode-language-pack-ja",\n
        "ms-vscode-remote.vscode-remote-extensionpack",\n
        "ms-vsliveshare.vsliveshare",\n
        "oderwat.indent-rainbow",\n
        "pkief.material-icon-theme",\n
        "ritwickdey.liveserver",\n
        "shardulm94.trailing-spaces",\n
        "streetsidesoftware.code-spell-checker",\n
        "usernamehw.errorlens",\n
        "gruntfuggly.todo-tree",\n
        "mosapride.zenkaku",\n
        // Git\n
        "eamodio.gitlens",\n
        "mhutchie.git-graph",\n
        // GitHub\n
        "github.vscode-pull-request-github",\n
        // HTML, XML\n
        "formulahendry.auto-complete-tag",\n
        // Markdown\n
        "davidanson.vscode-markdownlint",\n
        "shd101wyy.markdown-preview-enhanced",\n
        "yzhang.markdown-all-in-one",\n
        // Personal\n
        "hoovercj.vscode-power-mode",\n
        "tonybaloney.vscode-pets",\n
        // Prettier\n
        "esbenp.prettier-vscode",\n
        // Python\n
        "ms-python.python",\n
        "njpwerner.autodocstring",\n
        "tamasfe.even-better-toml",\n
        // YAML\n
        "redhat.vscode-yaml",\n
    ],\n
    "liveServer.settings.donotVerifyTags": true,\n
    "files.autoGuessEncoding": true,\n
    "editor.codeActionsOnSave": {\n
        "source.organizeImports": true,\n
    },\n
    "editor.formatOnSave": true,\n
    "editor.formatOnType": true,\n
    "files.insertFinalNewline": true,\n
    "cSpell.ignoreWords": [\n
        // アルファベット順\n
        "autodocstring",\n
        "azuretools",\n
        "ceintl",\n
        "davidanson",\n
        "donot",\n
        "eamodio",\n
        "errorlens",\n
        "esbenp",\n
        "extensionpack",\n
        "firstparty",\n
        "isort",\n
        "kohler",\n
        "liveserver",\n
        "localfolder",\n
        "mypy",\n
        "mechatroner",\n
        "mhutchie",\n
        "njpwerner",\n
        "oderwat",\n
        "pkief",\n
	    "powermode",\n
        "pyproject",\n
        "ritwickdey",\n
        "shardulm",\n
        "stdlib",\n
        "thirdparty",\n
        "usernamehw",\n
        "yzhang",\n
    ],\n
    // Markdown\n
    "markdownlint.config": {\n
        "MD033": false,\n
    },\n
    // Prettier\n
    "prettier.tabWidth": 4,\n
    "prettier.useTabs": true,\n
    // Python\n
    "python.analysis.autoImportCompletions": true,\n
    "python.analysis.autoImportUserSymbols": true,\n
    "python.analysis.completeFunctionParens": true,\n
    "python.analysis.extraPaths": [\n
		"${workspaceFolder}/.venv/lib/python*/site-packages/",\n
	],\n
    "python.analysis.inlayHints.functionReturnTypes": true,\n
    "python.analysis.inlayHints.variableTypes": true,\n
    "python.analysis.typeCheckingMode": "strict",\n
    "python.autoComplete.extraPaths": [\n
		"${workspaceFolder}/.venv/lib/python*/site-packages/",\n
	],\n
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",\n
    "python.formatting.provider": "black",\n
    "python.formatting.blackPath": "${workspaceFolder}/.venv/bin/black",\n
    "python.linting.flake8Enabled": true,\n
    "python.linting.flake8Path": "${workspaceFolder}/.venv/bin/flake8",\n
    "python.linting.flake8Args": [\n
        "--max-line-length=88",\n
        "--extend-ignore=E203",\n
    ],\n
    "python.linting.mypyEnabled": true,\n
    "python.linting.mypyPath": "${workspaceFolder}/.venv/bin/mypy",\n
    "python.linting.banditEnabled": true,\n
    "python.linting.banditPath": "${workspaceFolder}/.venv/bin/bandit",\n
    "isort.check": true,\n
    "isort.showNotifications": "onWarning",\n
    "isort.path": [\n
		"${workspaceFolder}/.venv/bin/isort"
	],\n
}\n
'

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
git config --global core.editor vim
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
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.prefer-active-python true --local
poetry init --no-interaction --name "${YOUR_PRJ_NAME}" --description "${DESCRIPTION}" --author "${AUTHOR}" --python ${PYTHON_VERSION}
echo -e ${PYPROJECT_TOML} >> ${PRJ_ROOT_PATH}/pyproject.toml
poetry install
echo -e "\n\n\nPoetry was installed and project directory was initialized successfully.\n\n\n"

# マーカーを挿入
echo -e "\n# end awesome-pydevenv\n" >> ~/.bashrc
echo -e "\n# end awesome-pydevenv\n" >> ~/.bash_profile
echo -e "\n# end awesome-pydevenv\n" >> ~/.profile

# リンター・フォーマッターをインストールする
poetry add --group dev bandit black flake8 isort mypy
echo -e "\n\n\nLinters and formatters were installed successfully.\n\n\n"

# VSCodeの設定
mkdir ${PRJ_ROOT_PATH}/.vscode
touch ${PRJ_ROOT_PATH}/.vscode/settings.json
echo -e ${SETTINGS_JSON} >> ${PRJ_ROOT_PATH}/.vscode/settings.json
echo -e "\n\n\nVSCode was configured successfully.\n\n\n"

# 必要なディレクトリとファイルを作成する
mkdir ${PRJ_ROOT_PATH}/src
touch ${PRJ_ROOT_PATH}/src/__init__.py
mkdir ${PRJ_ROOT_PATH}/tests
touch ${PRJ_ROOT_PATH}/tests/__init__.py
echo -e "\n\n\nDirectories and files were created successfully.\n\n\n"

# GitHubリポジトリにpushする
git add -A
git commit -m "プロジェクトを作成"
git push
echo -e "\n\n\nSuccessfully pushed to GitHub.\n\n\n"

# 仮想環境を立ち上げる
poetry shell

# 完了メッセージを表示
echo -e "\n\n\nCompleted!!\n\n\n"
