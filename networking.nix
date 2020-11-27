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
      allowPing = true;
      allowedTCPPorts = [ 80 443 6000 25565 ]; # HTTP, SSL, TOR, MINECRAFT
    };
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}