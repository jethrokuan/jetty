function fish_prompt
  set -l cblue (set_color 69D2E7)
  set -l cnormal (set_color normal)
  set -l pwd $cblue(prompt_pwd)$cnormal
  set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  set -g __fish_prompt_char "❯"

  # Override default ls to use colour
  alias ls "ls --color"

  echo -n -s \n\
  "$pwd "\
  (type -q git; and __print_git)
  printf "\n%s " "$__fish_prompt_char"
end
