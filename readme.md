## Utility generali / informazioni utili

# Per clonare il repo
cd ~
git clone https://github.com/KevKevin/kevnixos.git

# Per copiare il file di configurazione nel posto giusto
sudo cp ~/kevnixos/configuration.nix /etc/nixos/configuration.nix

# Per comprimere un file
sudo tar cfz big.tgz nomefile.estensione

# Per avere tutte le permission sul file / cartella
sudo chmod 777 nomefile.estensione

# Lista generazioni
sudo nixos-rebuild list-generations

# Elimina le generazioni piu vecchie di 15 giorni
sudo nix-collect-garbage --delete-older-than 15d

# Per disabilitare lo schermo del laptop
hyprctl keyword monitor "eDP-1, disable"


# display manager diverso (console) [da testare]
  pkgs.ly

# Nelle vm windows il driver per il virtual network interface dev'essere e1000e, non VirtIo, perche' ancora non ha tirato su i driver


# Per condividere una cartella su una vm (windows?) dopo aver aggiunto il FileSystem, aggiungere 
<binary path="/run/current-system/sw/bin/virtiofsd"/> nell' xml dell'oggetto filesystem 
e avere nella configuration.nix virtiofsd