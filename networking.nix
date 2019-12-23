{ lib, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 4387 ];
    permitRootLogin = "no";
    passwordAuthentication = false;
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

    defaultGateway = "185.141.24.1";
    defaultGateway6 = "fe80::21c:73ff:fe17:fdbc";

    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce true;

    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="185.141.24.22"; prefixLength=26; }
        ];
        ipv6.addresses = [
          { address="fe80::216:3cff:fe21:8cc7"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "185.141.24.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = "fe80::21c:73ff:fe17:fdbc"; prefixLength = 32; } ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="00:16:3c:21:8c:c7", NAME="eth0"
    
  '';
}
