source $HOME/.common_shell

if [ -f /etc/NIXOS ]; then
    eval "$(starship init bash)"
else
	PS1='\u@\h:\w\$ '
fi


# Added by GitLab Knowledge Graph installer
export PATH="$HOME/.local/bin:$PATH"
