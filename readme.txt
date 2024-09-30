sudo curl -LO --output-dir /etc/nixos https://raw.githubusercontent.com/KevKevin/kevnixos/refs/heads/main/configuration.nix


curl -LJO https://github.com/KevKevin/kevnixos/tree/983c2f824400739780800d291ba54616cc9334d3/testcartella


svn export https://raw.githubusercontent.com/KevKevin/kevnixos/refs/heads/main

git archive --remote=ssh://git@github.com:KevKevin/kevnixos.git HEAD ~/Desktop | tar -x

git clone https://github.com/KevKevin/kevnixos.git .


#per la login diversa
  services.xserver.displayManager.lightdm.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

#display manager diverso (console)
  pkgs.ly

