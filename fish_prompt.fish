function fish_prompt -d "Write out the prompt"
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_userhost
    set -g __fish_prompt_userhost
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_prompt_gray
    set -g __fish_prompt_gray (set_color -o black)
  end

  set -g __fish_prompt_cwd (set_color blue)

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
