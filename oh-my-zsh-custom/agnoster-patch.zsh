if [ "$ZSH_THEME" = "agnoster" ]
then
  # _prompt_git = prompt_git
  eval "`declare -f prompt_git | sed '1s/.*/_&/'`"

  prompt_git()
  {
    if [ -z "$AGNOSTER_SKIP_GIT" ] || [ "$AGNOSTER_SKIP_GIT" -eq "0" ]
    then
      _prompt_git $@
    fi
  }

  build_prompt() {
    RETVAL=$?
    prompt_status
    prompt_virtualenv
    prompt_context
    prompt_dir
    prompt_git
    # prompt_bzr
    # prompt_hg
    prompt_end
  }
fi
