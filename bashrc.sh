
eval "$(starship init bash)"
eval "$(thefuck --alias)"

export PATH=$PATH:/home/me/.local/bin
export PATH=$PATH:/snap/bin

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_rsa_herrnamenlos123 2> /dev/null

source ./aliases.sh
