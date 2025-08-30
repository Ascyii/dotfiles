source $HOME/.common_shell

if [ -f /etc/NIXOS ]; then
    eval "$(starship init bash)"
else
	PS1='\u@\h:\w\$ '
fi

export EDITOR="nvim"
export PATH=$HOME/programs_local/:~/projects/scripts:$PATH

alias r="ranger"
alias rr="yazi"
alias oati="~/projects/scripts/oathi.sh"
alias chch="~/projects/scripts/check_git.sh"
alias aut="~/projects/scripts/autostart-server.sh"
alias z="cd"
alias tt="~/projects/scripts/find_gits.sh"

