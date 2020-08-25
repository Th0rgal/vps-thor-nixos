{ pkgs, ... }:
let
  cash-place-packages = python-packages: with python-packages; [
    (callPackage ./pylibs/bit.nix { })
    aiohttp
    aiohttp-cors
    argon2_cffi
    toml
  ];
  cash-place-python = pkgs.python37.withPackages cash-place-packages;
in
  {
    systemd.services.cashplace = {
        description = "PROGRAMMESWAG";
        after = [ "network.target" ];

        serviceConfig = {
            Type = "simple";
            User = "thomas";
            ExecStart = cash-place-python + "/bin/python cashplace";
            WorkingDirectory = "/home/thomas/services/cash.place";
            Restart = "on-failure";
        };

        environment.PYTHON_HOME = cash-place-python;

        wantedBy = [ "multi-user.target" ];
    };
  }