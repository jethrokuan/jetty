function fish_prompt
  set -l cblue (set_color 69D2E7)
  set -l cnormal (set_color normal)
  set -l pwd $cblue(prompt_pwd)$cnormal
  set -l OS (uname)
  set -l git_output
  set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  set -g __fish_prompt_char "❯"

  if test $OS = "Linux"
    alias ls "ls --color=auto"
  else if test $OS = "Darwin"
    alias ls "ls -G"
  end

  if type -q git
    set normal (set_color normal)
    set dirty (set_color black -b F38630)
    set clean (set_color black -b 7AB317)
    set detached (set_color black -b FF0000)
    if set branch_name (git_branch_name)
      set -l gitporcelain (git_porcelain)
      set -l git_distance (git_distance)
      if test ! -z "$git_distance"
        set git_distance "($git_distance)"
      end
      set -l repo_status
      set -l branch_color ""

      if git_is_dirty
        set branch_color "$dirty"
      else
        set branch_color "$clean"
      end
      
      
      if git_is_staged
        if git_is_dirty
          set git_status "± "
        else
          set git_status "+ "
        end
      end

      if git_is_empty
        set repo_status "●"
      end
      
      if git_is_stashed
        set repo_status ".."
      end

      set git_output "$branch_color $branch_name$repo_status$git_distance $normal $gitporcelain"
    end
  end

  set -l ve ""
  if set -q VIRTUAL_ENV
    set ve (printf "(%s)" (basename $VIRTUAL_ENV))
end

  echo -n -s \n\
  "$ve $pwd "\
  "$git_output"
  printf "\n%s " "$__fish_prompt_char"
end
