{ pkgs, ... }:
let
  dear-packages = python-packages: with python-packages; [
    (callPackage ./pylibs/discordpy.nix { })
    toml
  ];
  dear-python = pkgs.python37.withPackages dear-packages;
in
  {
    systemd.services.dear = {
        description = "PROGRAMMESWAG";
        after = [ "network.target" ];

        serviceConfig = {
            Type = "simple";
            User = "thomas";
            ExecStart = dear-python + "/bin/python dear";
            WorkingDirectory = "/home/thomas/services/dear/";
            Restart = "on-failure";
        };

        environment.PYTHON_HOME = dear-python;

        wantedBy = [ "multi-user.target" ];
    };
}