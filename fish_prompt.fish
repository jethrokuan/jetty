function fish_prompt
  set -l BG "#D95B43"
  set -l cwd (prompt_pwd)
  set -l dir (dirname $cwd)
  set -l base (basename $cwd)

  segment " $base " white 00f
  segment " $dir " black white 
  segment prompt_git
  segment_close
end
