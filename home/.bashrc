source $HOME/.common_shell

if [ -f /etc/NIXOS ]; then
    eval "$(starship init bash)"
else
	PS1='\u@\h:\w\$ '
fi

