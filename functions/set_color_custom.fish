function set_color_custom
  set -U fish_color_normal                normal
  set -U fish_color_command               C7F464
  set -U fish_color_param                 ffefc7
  set -U fish_color_redirection           0fe169
  set -U fish_color_comment               626262
  set -U fish_color_error                 FF6B6B
  set -U fish_color_escape                C7F464
  set -U fish_color_operator              C7F464
  set -U fish_color_quote                 --background=C44D58
  set -U fish_color_autosuggestion        626262
  set -U fish_color_valid_path            --underline
  set -U fish_color_cwd                   C7F464
  set -U fish_color_cwd_root              ff0000
  set -U fish_color_match                 ffd700
  set -U fish_color_search_match          --background=C44D58
  set -U fish_color_selection             --background=C44D58
  set -U fish_pager_color_prefix          C7F464
  set -U fish_pager_color_completion      normal
  set -U fish_pager_color_description     555 ffd700
  set -U fish_pager_color_progress        C7F464
  set -U fish_color_history_current       C7F464
  set -gx LS_COLORS                        "di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
end

