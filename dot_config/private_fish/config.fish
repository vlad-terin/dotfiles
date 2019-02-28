#!/usr/bin/fish

# alias ag "ag --path-to-ignore ~/.ignore"
set -U FZF_LEGACY_KEYBINDINGS 0


#set -U FZF_DEFAULT_COMMAND "ag --hidden --ignore .git -l -g """
#set -U FZF_FIND_FILE_COMMAND "find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
#set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null """
#set -U FZF_CTRL_T_COMMAND "find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
#set -U FZF_OPEN_COMMAND "find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

fish_vi_key_bindings
function fish_mode_prompt
end
function fish_greeting
end

function fag
  if not set -q argv[1]
    echo "No argument"
    return
  end
  set -l out (ag --nogroup --hidden "$argv" | fzf)
  if test -n "$out"
    set -l cols (string split ":" $out)
    nvim $cols[1] +"normal! $cols[2]zz"
  end
end

function vf
	nvim (ag . --hidden | fzf)
end

# fzf 
function fzf-bcd-widget -d 'cd backwards'
	pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
	[ "$result" ]; and cd $result
	commandline -f repaint
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end


