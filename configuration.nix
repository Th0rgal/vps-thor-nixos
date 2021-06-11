{ pkgs, ... }: {
  require = [
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./web.nix

    ./services/dear.nix
    ./services/louis-a-dit.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [ wget git ];

  programs.fish.enable = true;
}
