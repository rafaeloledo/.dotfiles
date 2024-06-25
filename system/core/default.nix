{
  pkgs,
  options,
  config,
  lib,
  ...
}:

{
  boot = {
    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  users = {
    users.rgnh55 = {
      isNormalUser = true;
      description = "rgnh55";
      shell = pkgs.fish;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate scrcpy android-studio 
      ];
    };
    defaultUserShell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    hyprland.enable = true;
    firefox.enable = true;
  };

  time.timeZone = "America/Bahia";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  security.rtkit.enable = true;
  environment.shells = with pkgs; [ bash fish ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "RobotoMono Nerd Font" ]; })
  ];
  environment.systemPackages = with pkgs; [
     fish
     cachix
     cudaPackages.cudatoolkit
     nvtopPackages.full
     killall
     egl-wayland
     nvidia-vaapi-driver
     gcc
     gnumake
     cmake
  ];
  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
