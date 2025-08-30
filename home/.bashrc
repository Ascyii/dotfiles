source $HOME/.common_shell

# useful fror checking for nix or other
if [ -f /etc/NIXOS ]; then
    # We're on NixOS
    eval "$(starship init bash)"
else
	#Default prompt
	if [ -f "$HOME/programs_local/starship" ]; then
		export STARSHIP_CONFIG=~/configuration/other/starship.toml

		eval "$(starship init bash)"
	else
		PS1='\u@\h:\w\$ '
	fi
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

