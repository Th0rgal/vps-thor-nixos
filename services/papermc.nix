{ pkgs }: {
    description = "PROGRAMMESWAG";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "thomas";

        ExecStart = "${pkgs.zulu8}/bin/java -Xms2G -Xmx2G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar ./paper-225.jar";
        WorkingDirectory = "/home/thomas/services/papermc";
        Restart = "on-failure";
    };

    environment = {
        JAVA_HOME = pkgs.zulu8;
    };

    wantedBy = [ "multi-user.target" ];
}