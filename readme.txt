# Per clonare il repo
cd ~/Documents
git clone https://github.com/KevKevin/kevnixos.git .

# Per copiare il file di configurazione nel posto giusto
sudo cp ~/Documents/kevnixos/configuration.nix /etc/nixos/configuration.nix




#per la login diversa
  services.xserver.displayManager.lightdm.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

#display manager diverso (console)
  pkgs.ly

