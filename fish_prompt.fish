function fish_prompt
  set -l BG "#D95B43"
  set -l green "#7FFA0C"
  set -l yellow "#C3FA0C"
  set -l cwd (prompt_pwd)
  set -l dir (dirname $cwd)
  set -l base (basename $cwd)

  prompt_git
  segment " $base " white 00f
  segment " $dir " black white
  segment_close
end
