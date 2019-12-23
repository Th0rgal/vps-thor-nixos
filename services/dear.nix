{ pkgs }: {
    description = "PROGRAMMESWAG";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "thomas";
        ExecStart = "${pkgs.zulu8}/bin/java -jar ./dear.jar";
        WorkingDirectory = "/home/thomas/services";
        Restart = "on-failure";
    };

    environment = {
        JAVA_HOME = pkgs.zulu8;
    };

    wantedBy = [ "multi-user.target" ];
}