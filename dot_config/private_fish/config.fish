#!/usr/bin/fish

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


abbr v nvim
abbr k fkill
abbr t todo.sh add
abbr y "echo \"\" >> yay"
abbr ed "echo \"\" >> ~/.config/bmdirs"
abbr ef "echo \"\" >> ~/.config/bmfiles"
abbr s "npx degit sveltejs/template "
abbr n "npm run dev"
abbr r ranger

set -U FZF_LEGACY_KEYBINDINGS 0

fish_vi_key_bindings
function fish_mode_prompt
end
function fish_greeting
end

function f
  if not set -q argv[1]
    echo "no argument"
    return
  end
  set -l out (ag --nogroup --hidden "$argv" | fzf)
  if test -n "$out"
    set -l cols (string split ":" $out)
    nvim $cols[1] +"normal! $cols[2]zz"
  end
end

