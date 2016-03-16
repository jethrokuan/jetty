function fish_prompt
  set -l cblue (set_color 69D2E7)
  set -l cnormal (set_color normal)
  set -l pwd $cblue(prompt_pwd)$cnormal
  set -l git_output
  set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  set -g __fish_prompt_char "❯"

  # Override default ls to use colour
  alias ls "ls --color"

  if type -q git
    set normal (set_color normal)
    set dirty (set_color black -b F38630)
    set clean (set_color black -b 7AB317)
    set detached (set_color black -b FF0000)
    if set branch_name (git_branch_name)
      set -l gitporcelain (git_porcelain)
      set -l gitdistance (git_distance)
      if test ! -z "$gitdistance"
        set gitdistance "($gitdistance)"
      end
      set -l repo_status
      set -l branch_color ""

      if git_is_dirty
        set branch_color "$dirty"
      else
        set branch_color "$clean"
      end
      
      if git_is_touched
        if git_is_staged
          set repo_status "+"
        end
      else if git_is_empty
        set repo_status "●"

      else if git_is_stashed
        set repo_status ".."
      end

      set git_output "$branch_color $branch_name$repo_status$gitdistance $normal $gitporcelain"
    end
  end

  echo -n -s \n\
  "$pwd "\
  "$git_output"
  printf "\n%s " "$__fish_prompt_char"
end
