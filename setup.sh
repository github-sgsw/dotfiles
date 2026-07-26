#!/bin/zsh

# dotfilesリポジトリのルートパスを取得
DOT_DIRECTORY=$(cd $(dirname $0); pwd)

echo "Starting dotfiles setup..."

# ~/.config ディレクトリが存在することを確認
mkdir -p "$HOME/.config"

# シンボリックリンクを作成する関数
# usage: create_link <source_path> <target_path>
create_link() {
    local source=$1
    local target=$2

    # 親ディレクトリを作成
    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing $target"
        rm -rf "$target"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
}

# 1. ~/.config 配下に配置する設定
create_link "$DOT_DIRECTORY/helix" "$HOME/.config/helix"

# Helix runtime
# ソースからインストールした場合など、runtimeディレクトリが必要な場合にリンクします
# 他の端末ではパスが異なる可能性があるため、必要に応じて以下のパスを調整してください
HELIX_RUNTIME_SOURCE="$HOME/Project/Personal/helix/runtime"
if [ -d "$HELIX_RUNTIME_SOURCE" ]; then
    create_link "$HELIX_RUNTIME_SOURCE" "$HOME/.config/helix/runtime"
fi

create_link "$DOT_DIRECTORY/sheldon" "$HOME/.config/sheldon"
create_link "$DOT_DIRECTORY/wezterm" "$HOME/.config/wezterm"
create_link "$DOT_DIRECTORY/starship.toml" "$HOME/.config/starship.toml"

# 2. ホームディレクトリ直下に配置する設定
create_link "$DOT_DIRECTORY/zsh/.zshrc" "$HOME/.zshrc"

echo "Setup completed successfully!"
