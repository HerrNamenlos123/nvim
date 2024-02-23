# Example_config

This can be used as an example custom config for NvChad. Do check the https://github.com/NvChad/nvcommunity

## Installation

### Install NvChad

Windows:   
```
git clone https://github.com/NvChad/NvChad %localappdata%/nvim --depth 1 ; nvim
```
Linux:   
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### Install my config

Windows:   
```
git clone https://github.com/HerrNamenlos123/nvim %localappdata%/nvim/lua/custom
```
Linux:  
```
git clone https://github.com/HerrNamenlos123/nvim ~/.config/nvim/lua/custom
```

### Install Starship

Linux:
```
curl -sS https://starship.rs/install.sh | sudo sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
cp ~/.config/nvim/lua/custom/starship.toml ~/.config/starship.toml
```

Don't forget to change the starship logo!!!
