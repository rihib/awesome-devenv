# VSCode

## プロジェクト設定

ワークスペース直下に、同階層にある`.vscode/settings.json`をコピーして配置する。
&nbsp;
`VSCode`ディレクトリ下の`.vscode/settings.json`には一般的に必要な設定しか入っていないので、各ツールや技術スタックに固有の設定については、それぞれのディレクトリ下にある`.vscode/settings.json`に記述されているので、必要に応じてそれらの設定をコピーして追記すること。

## 個人設定

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
    "editor.autoIndent": "brackets",
    "editor.fontSize": 14,
    "material-icon-theme.activeIconPack": "react",
    "window.zoomLevel": 1,
}
```
