function fish_right_prompt
  set -l status_copy $status

  if test $status_copy -ne 0
    segment_right " ➶ $status_copy " ffefc7 bb0000
  end

  segment_right " "(date +%r)" " ffefc7 222

  segment_close
end
