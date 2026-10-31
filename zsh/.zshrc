# PATH設定
typeset -U path PATH

for dir in \
  "$HOME/.local/bin" \
  "$HOME/.local/share/mise/installs/coursier/latest/bin" \
  "$HOME/.ghcup/bin"
do
  [[ -d "$dir" ]] && path=("$dir" $path)
done

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

zshaddhistory() {
  local line="${1%%$'\n'}"
  if [[ "$line" =~ "^(eza|ls|cat|bat)($| )" ]]; then
    return 1
  fi
  return 0
}

setopt hist_ignore_all_dups  # 古い重複コマンドを削除
setopt hist_ignore_space     # 先頭にスペースがあるコマンドは保存しない
setopt hist_reduce_blanks    # 余分な空白を削除
setopt share_history         # ターミナル間で履歴をリアルタイム共有

autoload -Uz compinit
# キャッシュファイルが24時間以内に更新されていれば-C（高速化）で読み込む
if [[ -n ~/.zcompdump(N.mh-24) ]]; then
  compinit -C
else
  compinit
fi

# 外部ツール・プラグイン設定
eval "$(mise activate zsh)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

# zsh-autosuggestions のスタイル設定
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250,bg=238"

# エイリアス設定
alias eza='echo "# alias settings eza -la --sort=time"; \eza -la --sort=time'
# historyのデフォルト表示を100件にする
alias history='fc -l -100'
