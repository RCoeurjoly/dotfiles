# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
if [ -e /home/drcoeurjoly/.nix-profile/etc/profile.d/nix.sh ]; then . /home/drcoeurjoly/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
