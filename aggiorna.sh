echo - Aggiorno dal repository remoto
echo
sudo git pull

echo
echo - Creo cartella per la configurazione nix
sudo mkdir -p /etc/nixos

echo
echo - Copio la configurazione di nixos: configuration.nix
sudo cp ~/kevnixos/configuration.nix /etc/nixos/configuration.nix

# echo
# echo - Creo cartella per i3
# mkdir -p ~/.config/i3

# echo
# echo - Copio la configurazione di i3: config
# sudo cp ~/kevnixos/i3config.conf ~/.config/i3/config

# echo
# echo - Copio la configurazione di i3status: config
# sudo cp ~/kevnixos/i3statusconfig.conf ~/.config/i3/i3status.conf

echo
echo Aggiornamento completato!