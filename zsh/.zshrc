# PATHの重複を除去
typeset -U path PATH

path=(
  $HOME/.local/bin
  $HOME/.local/share/mise/installs/coursier/latest/bin
  $HOME/.ghcup/bin
  $path
)

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# historyに保存しない
zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(eza|ls|cat|bat|)($| )" ]]
}

setopt hist_ignore_dups      # 直前と同じコマンドは保存しない
setopt hist_ignore_all_dups  # 古い重複コマンドを削除
setopt hist_ignore_space     # 先頭にスペースがあるコマンドは保存しない
setopt hist_reduce_blanks    # 余分な空白を削除
setopt share_history         # ターミナル間で履歴をリアルタイム共有

eval "$(mise activate zsh)"

# compinitのキャッシュ化
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ターミナルの背景色と被ってサジェストが見えないため、サジェストに背景色を付与する
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250,bg=238"
eval "$(sheldon source)"

eval "$(starship init zsh)"

# alias
alias eza='echo "# alias settings eza -la --sort=time"; \eza -la --sort=time'
