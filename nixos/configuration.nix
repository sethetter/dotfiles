# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/nvme0n1p3";
      preLVM = true;
    }
  ];
  boot.loader.grub.device = "/dev/nvme0n1";

  networking.hostName = "metis"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;

  networking.extraHosts = ''
    192.168.10.10 homestead.local
  '';

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.wget
    pkgs.git
    pkgs.xclip
    pkgs.lsof
    pkgs.blueman
    pkgs.home-manager.home-manager
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fontconfig.enable = true;
    fontconfig.defaultFonts.monospace = [ "Fira Code" ];

    fonts = [
      pkgs.fira
      pkgs.fira-code
      pkgs.fira-code-symbols
      pkgs.emojione
      pkgs.noto-fonts
      pkgs.noto-fonts-emoji
      pkgs.powerline-fonts
    ];
  };

  # Fish Shell
  programs.fish.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.ssh.startAgent = false;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "sethetter" ];

  # Yubikey
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  '';

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    # Full version needed for bluetooth support.
    package = pkgs.pulseaudioFull;
  };

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    extraConfig = ''
      [General]
      ControllerMode = bredr
    '';
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";

  # Map caps lock to control.
  services.xserver.xkbOptions = "eurosign:e, ctrl:nocaps";
  i18n.consoleUseXkbConfig = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.desktopManager.default = "plasma5";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sethetter = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/fish";
    group = "users";
    extraGroups = [
      "wheel" "networkmanager" "disk" "audio" "video" "systemd-journal"
    ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    home-manager = import (fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz) {};
  };

  system.autoUpgrade.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
