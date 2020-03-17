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

  # Packages
  environment.systemPackages = with pkgs; [
     wget git rtorrent
  ];

  programs.fish.enable = true;
  systemd.services = {
      dear = import ./services/dear.nix { inherit pkgs; };
  }; # { inherit pkgs; } = { pkgs = pkgs }
}
