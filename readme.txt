# Per clonare il repo
cd ~/Documents
git clone https://github.com/KevKevin/kevnixos.git

# Per copiare il file di configurazione nel posto giusto
sudo cp ~/Documents/kevnixos/configuration.nix /etc/nixos/configuration.nix

#per comprimere un file
sudo tar cfz big.tgz nomefile.estensione

# Per avere tutte le permission sul file / cartella
sudo chmod 777 nomefile.estensione

# Lista generazioni
sudo nixos-rebuild list-generations

# Elimina le generazioni piu vecchie di 15 giorni
sudo nix-collect-garbage --delete-older-than 15d

# Per disabilitare lo schermo del laptop
hyprctl keyword monitor "eDP-1, disable"


34 bona


#display manager diverso (console)
  pkgs.ly
