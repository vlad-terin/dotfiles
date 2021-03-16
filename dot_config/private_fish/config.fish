#!/usr/bin/fish

# set -U FZF_LEGACY_KEYBINDINGS 1
# set -U FZF_FIND_FILE_COMMAND fd --ignore-file ~/.config/fd/ignore --hidden | fzf
#set -U FZF_CD_WITH_HIDDEN_COMMAND "cd (fd --type d --ignore-file ~/.config/fd/ignore --hidden | fzf)"
# set -g fish_key_bindings fish_default_key_bindings

bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

set -x PATH $PATH $HOME/.scripts/

set -xg EDITOR nvim
# set -xg BROWSER chromium

function fu
functions -v (functions | fzf | xargs echo)
end

function d
rm (cd ~/.config/fish/functions | ls ~/.config/fish/functions | fzf)
end

#fish_vi_key_bindings
function fish_mode_prompt
end
function fish_greeting
end

