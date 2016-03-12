function __print_git -d "Git Status"
  set branch_name
  set normal (set_color normal)
  set dirty (set_color F38630)
  set clean (set_color 7AB317)
  if set branch_name (git_branch_name)
    set -l gitporcelain (git_porcelain)
    set -l repo_status
    set -l branch_color

    if git_is_touched
      if git_is_dirty
        set branch_color $dirty
      else
        set branch_color $clean
      end 
      
      if git_is_staged
        set repo_status "+"
      end


    else if git_is_empty
      set repo_status "●"

    else if git_is_stashed
      set repo_status ".."
    end

    echo -n -s "$branch_color$branch_name$repo_status $normal $gitporcelain"
  end
end
