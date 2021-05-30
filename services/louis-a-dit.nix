{ pkgs, ... }:
let
  http-python = pkgs.python3.withPackages
    (python-packages: with python-packages; [ discordpy pillow toml ]);
in {
  systemd.services.louis-a-dit = {
    description = "PROGRAMMESWAG";
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      User = "thomas";
      ExecStart = http-python + "/bin/python ./louis.py";
      WorkingDirectory = "/home/thomas/services/louis-a-dit/";
      Restart = "on-failure";
    };

    environment.PYTHON_HOME = http-python;

    wantedBy = [ "multi-user.target" ];
  };
}
