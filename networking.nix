{ lib, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 4387 ];
    permitRootLogin = "no";
    passwordAuthentication = true;
  };

  networking = {
    hostName = "thor";
    firewall = {
      enable = false;
      allowPing = true;
      allowedTCPPorts = [ 80 443 6000 25565 ]; # HTTP, SSL, TOR, MINECRAFT
    };
    nameservers = [
      "9.9.9.9"
      "149.112.112.112"
    ];
  };
}