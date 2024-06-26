# prompt
setopt prompt_subst
function _fishy_collapsed_wd() {
    local i pwd
    pwd=("${(s:/:)PWD/#$HOME/~}")
    if (( $#pwd > 1 )); then
        for i in {1..$(($#pwd))}; do
            if [[ "$pwd[$i]" = .* ]]; then
                pwd[$i]="${${pwd[$i]}[1,3]}"
            else
                pwd[$i]="${${pwd[$i]}[1,2]}"
            fi
        done
    fi
    echo "${(j:/:)pwd}"
}
local CUSTOM_MSG="%B%F{red}PROMPT HERE >>>%f%b"
PS1=' ${CUSTOM_MSG} $(_fishy_collapsed_wd) %F{green}$%f '

local return_status="%B%F{red}%(?..%?)%f%b"
RPROMPT="${return_status} %T"
# end o prompt

# enable emacs mode
bindkey -e

