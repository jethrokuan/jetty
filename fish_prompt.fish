function fish_prompt
  set -l main_colour "53777A"
  set -l cwd (prompt_pwd)
  set -l dir (dirname $cwd)
  set -l base (basename $cwd)

  prompt_git
  segment " $cwd " black $main_colour
  segment_close
end
