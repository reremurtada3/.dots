# .dots


### basic configs
```bash
sudo nmcli dev wifi connect "wifiname" password "wifipassword"
```

### Network Manager
```bash
nmtui
nmcli
```

### Update packages
```bash
sudo pacman -Syu
```
### Installing yay
```bash
cd $HOME/Documents/github
git clone https://aur.archlinux.org/yay.git
```
```bash
cd yay
sudo pacman -S base-devel
makepkg -si 
```
### apps I use
```bash
sudo pacman -S --needed hyprpaper waybar hyprlock hypridle keyd mpd rmpc neovim rofi swaync qt6ct tmux wev wl-clip-persist kvantum networkmanager network-manager-applet nemo brightnessctl hyprpicker gimp gmic gimp-plugin-gmic ghostscript gsfonts mypaint-brushes imagemagick nodejs npm clang docker xorg-xhost ufw openssh unzip git base-devel fastfetch stow noto-fonts-emoji usbutils libreoffice-fresh zip kicad kicad-library kicad-library-3d virt-manager qemu-desktop edk2-ovmf sl firefox discord kitty cmake zoxide zsh steam bluetui
```
```bash
yay -S wlogout hyprshot gimp-plugin-resynthesizer docker-buildx webapp-manager zen-browser-bin spotify pavucontrol vesktop walker elephant-all heroic-games-launcher
```

## Git 

``` bash
  git init
  git remote add origin REMOTEURL
  git pull origin main
```

## Vim 

```Vim
  %s/oldword/newword/g
### for escape keys
  ```bash
  %s/\\/newword/g
```
```

## Finding keys
```bash
  wev
```

## Adding a lang
* Uncomment lang from etc/locale.gen
* Run the next command to generate
```bash 
locale-gen
```
* Go to hypr config file and go to input
* add desired language to the kb_layout along side English
* (optional), add keybind by adding the next code to the input function
```bash
kb_options=grp:win_space_toggle
```

## TPM
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## Markdown

## Pacman list downloaded packages
```bash
pacman -Qqe > package_list.txt
```

## Root
```bash
sudo su
```

## How to properly uninstall lazyvim
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## Switching from Bash to zsh
```
sudo pacman -S zsh
```
```
chsh -s $(which zsh)
```

## My Fonts
```
ttf-bigblueterminal-nerd
```


## Ohmyzsh
``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Zinit
```
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
```

## ohmyposh
curl -s https://ohmyposh.dev/install.sh | bash -s
