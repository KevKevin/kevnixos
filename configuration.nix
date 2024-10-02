# /etc/nixos/configuration.nix

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;

  # Host
  boot.loader.efi.canTouchEfiVariables = true;

  # Guest
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.useOSProber = true;

  boot.kernelModules = ["vfio-pci" "rtw89"];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Blocca completamente tutto, attenzione
  # boot.kernelParams = ["intel_iommu=on" "hugepagesz=1G" "hugepages=24"];

  networking.hostName = "nixos"; # Define your hostname.

  # Abilitare il wifi
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.interfaces = ["wlp2s0"];
  networking.wireless.userControlled.enable = true;

  # Enable networking
  networking.networkmanager =
  {
    enable = true;
    # unmanaged = [ "*" "except:type:wwan" "except:type:gsm" ]; # Serve per il wifi [test]
  };
  
  # Enable bluetooth [test]
  hardware.bluetooth.enable = true;                         # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;                    # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings.General.Experimental = true;
  
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  #login diversa?
  #services.xserver.displayManager.lightdm.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;           #login manager
  # services.desktopManager.plasma6.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;    #login manager
  # services.xserver.desktopManager.gnome.enable = true;

  #services.displayManager.sddm.wayland.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
    # xwayland.hidpi = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";

    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    #Opengl
    opengl.enable = true;

    # Most wayland compositors need this
    # nvidia.modesetting.enable = true;
  };

  # Gnome
  # services.gvfs.enable = true;
  # services.gnome.gnome-keyring.enable = true;

  # i3
  #services.xserver.windowManager.i3 = {
  #  enable = true;
  #  extraPackages = with pkgs; [
  #    i3status
  #  ];
  #};
  #services.xserver.desktopManager = {
  #  xterm.enable = false;
  #  xfce = {
  #    enable = true;
  #    noDesktop = true;
  #    enableXfwm = false;
  #  };
  #};
  #services.xserver.displayManager = {
  #  lightdm.enable = true;
  #  defaultSession = "xfce+i3";
  #};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevin = {
    isNormalUser = true;
    description = "Kevin";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ]; # libvirtd serve per la connessione di qemu/kvm
    packages = with pkgs; [
      pkgs.neofetch
      pkgs.vscode
      pkgs.cmatrix
      pkgs.hollywood
      pkgs.glances
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Virtualisation
  virtualisation = 
  {
    libvirtd = 
    {
     enable = true;
     onShutdown = "suspend";
     onBoot = "ignore";
     qemu = 
     {
       package = pkgs.qemu_kvm;
       ovmf.enable = true;
       ovmf.packages = [ pkgs.OVMFFull.fd ];
       swtpm.enable = true;
       runAsRoot = false;
     };
    };
    # Serve per il network
    spiceUSBRedirection.enable = true;
  };
  
  virtualisation.vmware.host.enable = true;

  # Serve per abilitare il copia incolla nelle vm linux
  # services.spice.vdagentd.enable = true;
  # services.qemuGuest.enable = true;
  
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  programs.virt-manager.enable = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  # nix.settings.experimental-features = [ "nix-command" "flakes" ]
 
  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
  pkgs.git
  pkgs.blueman              #bluetooth
  pkgs.alacritty            #terminale
  pkgs.kitty                #terminale default per hyprland
  pkgs.hyprland
  pkgs.wayland
  pkgs.waybar
  pkgs.hyprpaper
  kdePackages.qtwayland     #serve per far funzionare kdepackages su wayland
  kdePackages.qtsvg
  pkgs.kdePackages.dolphin  #file manager
  pkgs.virt-manager         #virtualizzazione
  pkgs.spice
  pkgs.spice-gtk
  pkgs.spice-protocol
  pkgs.spice-vdagent
  pkgs.win-virtio
  pkgs.win-spice
  pkgs.swtpm
  pkgs.wpa_supplicant
  #pkgs.dmenu                 #dmenu classico testuale in alto
  #pkgs.gnome.gnome-keyring   #roba gnome / i3
  pkgs.firefox               #browser
  pkgs.eww
  pkgs.rofi-wayland # da testare
  pkgs.wofi
  pkgs.vmware-workstation
  pkgs.gparted
  ];

  environment.etc = {
   "ovmf/edk2-x86_64-secure-code.fd" = {
     source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
   };

   "ovmf/edk2-i386-vars.fd" = {
     source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
   };
  };  

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
