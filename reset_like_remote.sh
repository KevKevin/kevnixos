echo - Creo cartella per la configurazione nix
mkdir -p /etc/nixos

echo
echo - Copio la configurazione di nixos: configuration.nix
sudo cp ~/Documents/kevnixos/configuration.nix /etc/nixos/configuration.nix

echo
echo - Creo cartella per hypr
mkdir -p ~/.config/hypr

echo
echo - Copio la configurazione di Hyprland: hyprland.conf
sudo cp ~/Documents/kevnixos/hyprland.conf ~/.config/hypr/hyprland.conf

echo
echo - Copio la configurazione di Hyprpaper: hyprpaper.conf
sudo cp ~/Documents/kevnixos/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

echo
echo - Creo cartella per waybar
mkdir -p ~/.config/waybar

echo
echo - Copio la configurazione di Waybar: config.jsonc
sudo cp ~/Documents/kevnixos/config.jsonc ~/.config/waybar/config.jsonc

echo
echo - Creo cartella per i3
mkdir -p ~/.config/i3

echo
echo - Copio la configurazione di i3: config
sudo cp ~/Documents/kevnixos/i3config.conf ~/.config/i3/config

echo
echo - Creo cartella per i3status
mkdir -p ~/.config/i3status

echo
echo - Copio la configurazione di i3status: config
sudo cp ~/Documents/kevnixos/i3statusconfig.conf ~/.config/i3status/config

echo
echo Reset completato!