{ pkgs, ... }:
let
  nexmind-node-packages = python-packages: with python-packages; [
    aiofiles
    aiohttp
    aiohttp-cors
    argon2_cffi
    pyjwt
  ];
  nexmind-node-python = pkgs.python37.withPackages nexmind-node-packages;
in
  {
    systemd.services.nexnode = {
        description = "PROGRAMMESWAG";
        after = [ "network.target" ];

        serviceConfig = {
            Type = "simple";
            User = "thomas";
            ExecStart = nexmind-node-python + "/bin/python . --path=/tmp/nexnode_process.sock";
            WorkingDirectory = "/home/thomas/services/nexmind-node/nexmind-node";
            Restart = "on-failure";
        };

        environment.PYTHON_HOME = nexmind-node-python;

        wantedBy = [ "multi-user.target" ];
    };
}