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
    kernelParams = [ "net.ifnames=0" "biosdevname=0" ];
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
     wget git conda rtorrent
  ];

  programs.fish.enable = true;
}
