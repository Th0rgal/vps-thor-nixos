{ pkgs, ... }:
let
  rtx-python = python3.withPackages (python-packages: with python-packages; [
    aiohttp telethon toml
  ]);
in
  {
    systemd.services.rtxgobrrr = {
        description = "PROGRAMMESWAG";
        after = [ "network.target" ];

        serviceConfig = {
            Type = "simple";
            User = "thomas";
            ExecStart = rtx-python + "/bin/python rtxgobrrr";
            WorkingDirectory = "/home/thomas/services/rtxgobrrr/";
            Restart = "on-failure";
        };

        environment.PYTHON_HOME = rtx-python;

        wantedBy = [ "multi-user.target" ];
    };
}