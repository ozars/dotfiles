if [ "$ZSH_THEME" = "agnoster" ]
then
  # _prompt_git = prompt_git
  eval "`declare -f prompt_git | sed '1s/.*/_&/'`"
  # _prompt_hg = prompt_hg
  eval "`declare -f prompt_hg | sed '1s/.*/_&/'`"

  prompt_git()
  {
    if [ x"$(git config omz.large-git-repo)" = x"true" ];
    then
        return
    fi
    if [ ! $not_large ] && [ -z "$AGNOSTER_SKIP_GIT" ] || [ "$AGNOSTER_SKIP_GIT" -eq "0" ]
    then
      _prompt_git $@
    fi
  }

  prompt_hg()
  {
    if [ -z "$AGNOSTER_SKIP_HG" ] || [ "$AGNOSTER_SKIP_HG" -eq "0" ]
    then
      _prompt_hg $@
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
    prompt_hg
    prompt_end
  }
fi
