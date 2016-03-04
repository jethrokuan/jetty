function echo_right
  set -l argstring "$argv"
  set -l columns (math $COLUMNS - (echo "$argstring" | wc -c))
  echo -n (printf "%-"$columns"s%s" " " "$argstring")
end
