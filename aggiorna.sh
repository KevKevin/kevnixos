echo - Aggiorno dal repository remoto
echo
git pull

echo
echo - Creo cartella per la configurazione nix
mkdir -p /etc/nixos

echo
echo - Copio la configurazione di nixos: configuration.nix
sudo cp ~/kevnixos/configuration.nix /etc/nixos/configuration.nix

# echo
# echo - Creo cartella per hypr
# mkdir -p ~/.config/hypr

# echo
# echo - Copio la configurazione di Hyprland: hyprland.conf
# sudo cp ~/kevnixos/hyprland.conf ~/.config/hypr/hyprland.conf

# echo
# echo - Copio la configurazione di Hyprpaper: hyprpaper.conf
# sudo cp ~/kevnixos/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# echo
# echo - Creo cartella per waybar
# mkdir -p ~/.config/waybar

# echo
# echo - Copio la configurazione di Waybar: config.jsonc
# sudo cp ~/kevnixos/config.jsonc ~/.config/waybar/config.jsonc

echo
echo - Creo cartella per i3
mkdir -p ~/.config/i3

echo
echo - Copio la configurazione di i3: config
sudo cp ~/kevnixos/i3config.conf ~/.config/i3/config

echo
echo - Copio la configurazione di i3status: config
sudo cp ~/kevnixos/i3statusconfig.conf ~/.config/i3/i3status.conf

echo
echo Aggiornamento completato!