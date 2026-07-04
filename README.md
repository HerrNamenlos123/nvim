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

### Install this config

This repo is a self-contained NvChad (v2.5) starter config -- `NvChad/NvChad` is
pulled in automatically by lazy.nvim as a plugin dependency, no separate clone needed.

Windows:
```
git clone https://github.com/HerrNamenlos123/nvim %localappdata%/nvim && nvim
```
Linux:
```
git clone https://github.com/HerrNamenlos123/nvim ~/.config/nvim && nvim
```

### Install Starship

Windows:
```
winget install --id Starship.Starship
```
```
https://github.com/chrisant996/clink/releases
```
Add to Path:
```
C:\Program Files (x86)\clink
```
```
clink autorun install -- --quiet
echo dofile(os.getenv("LOCALAPPDATA") .. "/nvim/lua/extras/clink.lua") > "%localappdata%\clink\clink-config.lua"
```

Linux:
```
curl -sS https://starship.rs/install.sh | sudo sh
```
```
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```
```
cp ~/.config/nvim/lua/extras/starship.toml ~/.config/starship.toml
```
```
echo 'source ~/.config/nvim/lua/extras/aliases.sh' >> ~/.bashrc
```

And change the starship logo:
```
nvim ~/.config/starship.toml
```
