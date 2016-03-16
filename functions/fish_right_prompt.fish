function fish_right_prompt
  echo -n -s " "(date +%r) " "
  set -l status_copy $status

  if test "$CMD_DURATION" -gt 20
    set -l duration (echo $CMD_DURATION | humanize_time)
    set -l duration_color 777

    if test "$CMD_DURATION" -gt 2000
      set duration_color f00
    end

    if test ! -z "$duration"
      printf (set_color $duration_color)"$duration "(set_color normal)
    end
  end

  if test $status_copy -ne 0
    printf (set_color f00)"→ $status_copy "(set_color normal)
  end 
end
