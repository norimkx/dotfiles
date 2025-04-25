# dotfiles

## Setup スクリプトの実行

```bash
sudo ./scripts/setup.sh
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

### Node.js のインストール

```bash
nvm ls-remote
nvm i v22.14.0 # 適切なバージョンを選択
nvm current    # バージョンを確認
```

### PostgreSQL のインストール

```bash
brew install postgresql@17
echo >>"$HOME/.bashrc"
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@17/bin:$PATH"' >>"$HOME/.bashrc"
```

#### 起動状況の確認、起動、停止

- `brew services list`
- `brew services start postgresql@17`
- `brew services stop postgresql@17`
