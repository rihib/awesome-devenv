# VSCode

## 設定

### プロジェクト設定

ワークスペース直下に、同階層にある`.vscode/settings.json`をコピーして配置する。
<br/>
`VSCode`ディレクトリ下の`.vscode/settings.json`には一般的に必要な設定しか入っていないので、各ツールや技術スタックに固有の設定については、それぞれのディレクトリ下にある`.vscode/settings.json`に記述されているので、必要に応じてそれらの設定をコピーして追記すること。

### 個人設定

ローカルのVSCodeの`settings.json`に設定する項目の例を以下に示す。

```json
{
    // Personal
    "workbench.colorTheme": "Default Light+",
    "workbench.startupEditor": "none",
    "explorer.confirmDragAndDrop": false,
    "explorer.confirmDelete": false,
    "terminal.integrated.enableMultiLinePasteWarning": false,
    "security.workspace.trust.untrustedFiles": "open",
    "workbench.iconTheme": "material-icon-theme",
    "editor.autoIndent": "advanced",
    "editor.fontSize": 14,
    "material-icon-theme.activeIconPack": "react",
    "window.zoomLevel": 1,
}
```

## 拡張機能

拡張機能については、[awesome-vscode](https://github.com/viatsko/awesome-vscode)が参考になる。

### おもしろ拡張機能

#### [vscode-pets](https://marketplace.visualstudio.com/items?itemName=tonybaloney.vscode-pets)

```json
{
    // Personal
    "vscode-pets.theme": "beach",
    "vscode-pets.throwBallWithMouse": true,
    "vscode-pets.petSize": "medium",
}
```

#### [Power Mode](https://marketplace.visualstudio.com/items?itemName=hoovercj.vscode-power-mode)

```json
{
    // Personal
    "powermode.enabled": true
    "powermode.presets": "fireworks",
    "powermode.combo.counterEnabled": "show",
    "powermode.shake.enabled": false,
    "powermode.combo.timeout": 1,
    // Project
    // General
    "cSpell.ignoreWords": [
        // アルファベット順
        "powermode",
    ],
}
```
