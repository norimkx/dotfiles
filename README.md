# dotfiles

WSL2 (Debian) 環境向けの個人用 dotfiles です。
シェル・エディタ・ターミナルの設定と、環境構築を自動化するスクリプト群を管理しています。

## 構成

```
.
├── .bashrc                # bash の設定
├── .gitconfig             # git の設定
├── .tmux.conf             # tmux の設定
├── .config/
│   ├── nvim/              # Neovim の設定 (LazyVim ベース)
│   ├── lazygit/config.yml # lazygit の設定
│   └── starship.toml      # starship (プロンプト) の設定
└── scripts/
    ├── setup.sh           # 初期環境構築をまとめて実行するスクリプト
    ├── apt.sh             # apt パッケージのインストール
    ├── brew.sh            # Homebrew のインストール・Brewfile の反映
    ├── Brewfile            # Homebrew でインストールするパッケージの定義
    ├── tmux.sh             # tmux plugin manager (tpm) のインストール
    ├── link.sh             # dotfiles から $HOME へのシンボリックリンク作成
    └── tools.sh            # GitHub リリースから exe ツールをダウンロード・配置
```

## 使用しているツール

- シェル: bash + [starship](https://starship.rs/)
- エディタ: [Neovim](https://neovim.io/) ([LazyVim](https://www.lazyvim.org/) ベース)
- ターミナルマルチプレクサ: [tmux](https://github.com/tmux/tmux) ([tpm](https://github.com/tmux-plugins/tpm) でプラグイン管理)
- パッケージ管理: [Homebrew](https://brew.sh/) ([Brewfile](scripts/Brewfile) で一括管理) / mise (Node.js, Java などのランタイム管理)
- Git UI: [lazygit](https://github.com/jesseduffield/lazygit)
- Git diff: [delta](https://github.com/dandavison/delta) ([catppuccin](https://github.com/catppuccin/delta) latte テーマ適用、git / lazygit 共通)

## セットアップ

新しい環境で初期セットアップを行う場合は、リポジトリを `~/dotfiles` に配置し、`setup.sh` を実行してください。

```bash
git clone <このリポジトリのURL> ~/dotfiles
cd ~/dotfiles
./scripts/setup.sh
```

`setup.sh` は以下の処理を順番に実行します。

1. `apt.sh` — apt パッケージの更新・インストール
2. `brew.sh` — Homebrew のインストールと `Brewfile` に基づくパッケージのインストール
3. `tmux.sh` — tmux plugin manager (tpm) のインストール
4. `link.sh` — dotfiles を `$HOME` にシンボリックリンク
5. `tools.sh` — GitHub リリースからバイナリツール (win32yank, zenhan) を `~/.local/bin` にインストール
6. `gh auth login` — GitHub CLI の認証

各スクリプトは単独でも実行できるため、特定の処理だけをやり直したい場合は個別に実行してください。

```bash
./scripts/link.sh   # シンボリックリンクの張り直しのみ行う場合
./scripts/tools.sh  # exe ツールの再インストールのみ行う場合
```

## 補足

- Homebrew でインストールするパッケージは [`scripts/Brewfile`](scripts/Brewfile) に集約しています。パッケージを追加・削除する場合はこのファイルを編集してください。
- `link.sh` はシンボリックリンク済みのファイルを上書きするため、既存の設定ファイルがある場合は事前にバックアップを取ってください。
