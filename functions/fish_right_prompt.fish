function fish_right_prompt
  set -l status_copy $status
  set -l right_prompt ""

  #Check if has Gemfile
  if git_is_repo
    set -l path (git rev-parse --show-toplevel)
    set -l git_repository_gemfile_path "$path/Gemfile"

    if test -e $git_repository_gemfile_path
      set -l rubyv (command ruby -v | awk '{print $2}' | cut -d'p' -f1)
      set right_prompt $right_prompt (set_color --bold red) '◃▸' (set_color --bold white) " ruby $rubyv " (set_color normal) 
    end
  end

  if test "$CMD_DURATION" -gt 500
    set -l duration (echo $CMD_DURATION | humanize_duration)
    set -l duration_color 777

    if test "$CMD_DURATION" -gt 2000
      set duration_color f00
    end
    
    if test ! -z "$duration"
      set right_prompt $right_prompt (set_color $duration_color) "$duration " (set_color normal)
    end

    if test $status_copy -ne 0
      set right_prompt $right_prompt (set_color f00)"→ $status_copy "(set_color normal)
    end
  end

  if test -z "$right_prompt"
    set -l d (date +%r)
    set right_prompt $right_prompt "$d "
  end

  echo -n -s $right_prompt
end
