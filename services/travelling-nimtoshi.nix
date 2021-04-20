{ pkgs, ... }:
let
  http-python = pkgs.python3.withPackages
    (python-packages: with python-packages; [ aiohttp ]);
in {
  systemd.services.travelling-nimtoshi = {
    description = "PROGRAMMESWAG";
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      User = "thomas";
      ExecStart = http-python + "/bin/python ./main.py";
      WorkingDirectory = "/home/thomas/services/travelling-nimtoshi/";
      Restart = "on-failure";
    };

    environment.PYTHON_HOME = http-python;

    wantedBy = [ "multi-user.target" ];
  };
}
