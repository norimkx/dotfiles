# dotfiles

## Setup スクリプトの実行

```bash
./scripts/setup.sh
```

## Link スクリプトの実行

```bash
./scripts/link.sh
```

## 手動セットアップ

### Neovim

以下を `~/bin` に配置し、実行権限を付与する。

- [win32yank](https://github.com/equalsraf/win32yank/releases)
- [zenhan](https://github.com/iuchim/zenhan/releases)

### GitHub CLI のインストールと認証

```bash
brew install gh
gh auth login
```
