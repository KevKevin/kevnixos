# provare la vm windows su plasma / gnome per capire se è meglio per gli shortcut

# provare il window manager tiled per gnome
pkgs.gnomeExtensions.pop-shell
https://github.com/pop-os/shell

# dividere in sottocartelle gli scripts

# implementare powerline-go
pkgs.powerline-go

# i3
    # trovare una status bar migliore di quella default (bumblebee-status sarebbe ottima ma non funziona)
    {
        pkgs.bumblebee-status
        https://bumblebee-status.readthedocs.io/en/main/index.html#
        Moduli:
        title cpu memory disk layout pulseaudio nic bluetooth battery datetime system
        Tema:
        -t moonlight-powerline
    }

    ## provare https://github.com/nwg-piotr/autotiling su i3

    ## provare https://github.com/jonaburg/picom su i3 
