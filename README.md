# Example_config

This can be used as an example custom config for NvChad. Do check the https://github.com/NvChad/nvcommunity

## Installation

### Install Neovim

Windows:
```
winget install Neovim.Neovim
```

Linux:
```
sudo apt update && sudo apt install -y curl wget python3 python3-venv xclip
```
```
sudo mkdir -p /opt/bin/ && sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -P /opt/bin/
```
```
sudo chmod +x /opt/bin/nvim.appimage
```
```
sudo ln -s /opt/bin/nvim.appimage /usr/bin/nvim
```

### Install Nerd Font

```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
```
```
unzip -d fonts JetBrainsMono.zip
```
```
open fonts/JetBrainsMonoNerdFont-Medium.ttf
```
```
rm -rf JetBrainsMono.zip fonts/
```

And set the font to `JetBrainsMono Nerd Font` in Terminal Preferences!

### Install NvChad

Windows:   
```
git clone https://github.com/NvChad/NvChad %localappdata%/nvim --depth 1 --branch v2.0
```
Linux:   
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 --branch v2.0
```

### Install my config

Windows:   
```
git clone https://github.com/HerrNamenlos123/nvim %localappdata%/nvim/lua/custom && nvim
```
Linux:  
```
rm -rf ~/.config/nvim/lua/custom && git clone https://github.com/HerrNamenlos123/nvim ~/.config/nvim/lua/custom && nvim
```

### Install Starship

Windows:
```
winget install --id Starship.Starship
winget install clink
```

Linux:
```
curl -sS https://starship.rs/install.sh | sudo sh
```
```
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```
```
cp ~/.config/nvim/lua/custom/starship.toml ~/.config/starship.toml
```
```
echo 'source ~/.config/nvim/lua/custom/aliases.sh' >> ~/.bashrc
```

And change the starship logo:
```
nvim ~/.config/starship.toml
```
