{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  
  # my hostname
  networking.hostName = "snowflake";

  # my timezone
  time.timeZone = "America/Sao_Paulo";

  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
    console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
   };

  # enable the X11 windowing system.
  services.xserver.enable = true; 
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.lightdm.enable = true;  

  # configure keymap in X11
   services.xserver.layout = "br";
  
  # my user (leo@snowflake)
  users.users.leo = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # enable sudo
   };

  # list of packages
   environment.systemPackages = with pkgs; [
     vim
     wget
     firefox
     neofetch
     neovim
     alacritty
   ];

  # enable openssh
  services.openssh.enable = true;
  system.stateVersion = "21.11";
}
