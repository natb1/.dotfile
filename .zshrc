autoload -U +X bashcompinit && bashcompinit

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/n8/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/n8/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/n8/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/n8/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd() { vcs_info }

_pr_jobs() {
  # https://superuser.com/questions/1735201/zsh-script-not-printing-output-of-jobs-command
  tmp=$(mktemp)
  print $(jobs) > $tmp
  JOBS=$(< $tmp)
  rm $tmp
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _pr_jobs

setopt PROMPT_SUBST
HR='${(r:$COLUMNS::_:)}'
WORKING_PATH='%1d/'
JOB_SYMBOL='%(1j.%{$c[blue]$c_bold$c_dim%}%{$c_reset%}.)'
PROMPT="$HR\$JOBS\${VENV_BASE:+(\$VENV_BASE)} $JOB_SYMBOL $WORKING_PATH \${vcs_info_msg_0_} %% "
zstyle ':vcs_info:git:*' formats '%b'
