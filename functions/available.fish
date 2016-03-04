function available -a name -d "Check if a function or program is available."
  type "$name" ^/dev/null >&2
end
