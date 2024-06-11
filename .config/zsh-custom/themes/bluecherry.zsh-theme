# 
# Loosely based off how the agnoster theme constructs it's prompt.
# 

# Create a segment.
prompt_segment() {
  [[ -n $1 ]] && echo -n $1
}

prompt_arch_symbol() {
  local ARCH_SYMBOL
  # use a replacement character for tty sessions
  [[ $(tty) =~ (/dev/tty[1-9]) ]] && ARCH_SYMBOL="$" || ARCH_SYMBOL=" "

  prompt_segment " %{$fg[red]%}$ARCH_SYMBOL"
}

prompt_status() {
  # return value
  prompt_segment "%(?: : %{$fg_bold[red]%}(%?%)%{$reset_color%} )"

  # TODO
  # local jobcount=$(jobs -l | wc -l)
  # [[ $jobcount -gt 0 ]] && prompt_segment "[$jobcount jobs]"
}

prompt_dir() {
  prompt_segment "%{$fg[cyan]%}[ %{$fg[magenta]%}%~ %{$fg[cyan]%}] "
}

ZSH_THEME_VIRTUALENV_PREFIX="> %{$fg[green]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%} %{$fg[cyan]%}"

prompt_venv() {
  prompt_segment "$(virtualenv_prompt_info)"
}

ZSH_THEME_GIT_PROMPT_PREFIX="> %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

prompt_git() {
  prompt_segment "$(git_prompt_info)"
}

prompt_end() {
  prompt_segment "%{$fg[cyan]%}> %{$reset_color%}"
}

build_prompt() {
  prompt_arch_symbol
  prompt_status
  prompt_dir
  prompt_venv
  prompt_git
  prompt_end
}

PROMPT='$(build_prompt)'