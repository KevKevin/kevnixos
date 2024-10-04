echo Creo cartella per la configurazione nix
mkdir -p /etc/nixos

echo Copio la configurazione di nixos: configuration.nix
sudo cp ~/Documents/kevnixos/configuration.nix /etc/nixos/configuration.nix

echo Creo cartella per hypr
mkdir -p ~/.config/hypr

echo Copio la configurazione di Hyprland: hyprland.conf
sudo cp ~/Documents/kevnixos/hyprland.conf ~/.config/hypr/hyprland.conf

echo Copio la configurazione di Hyprpaper: hyprpaper.conf
sudo cp ~/Documents/kevnixos/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

echo Creo cartella per waybar
mkdir -p ~/.config/waybar

echo Copio la configurazione di Waybar: config.jsonc
sudo cp ~/Documents/kevnixos/config.jsonc ~/.config/waybar/config.jsonc

