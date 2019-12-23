{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./web.nix
  ];

  boot = {
    kernelParams = [ "net.ifnames=0" "biosdevname=0" ];
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  programs.fish.enable = true;
  systemd.services = {
      dear = import ./services/dear.nix { inherit pkgs; };
      papermc = import ./services/papermc.nix { inherit pkgs; };
  }; # { inherit pkgs; } = { pkgs = pkgs }
}
