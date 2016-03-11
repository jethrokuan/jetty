function fish_prompt -d "Write out the prompt"
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_userhost
    set -g __fish_prompt_userhost
    end

    if not set -q __fish_prompt_char
      set -g __fish_prompt_char "❯"
    end

    echo -n -s \n \
    "$__fish_prompt_cwd"\
    (prompt_pwd)\
    "$__fish_prompt_normal "\
    (available git; and segment_git)
    printf "\n%s " "$__fish_prompt_char"
end
