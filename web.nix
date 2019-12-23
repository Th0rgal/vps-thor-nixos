{ ... }: {
    services.nginx = {
        enable = true;

        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;

        sslCiphers = "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305";

        commonHttpConfig = ''
          add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;

          ssl_session_timeout 1d;
          ssl_session_cache shared:MozSSL:10m;
          ssl_session_tickets off;
          ssl_prefer_server_ciphers off;

          ssl_stapling on;
          ssl_stapling_verify on;
        '';

        virtualHosts = let vhost = config: (config // {
            http2 = true;
            enableACME = true;
            forceSSL = true;
            extraConfig = ''
                charset UTF-8;
            '';
        }); in {
            "hackedserver.info" = vhost { root = "/var/www/hackedserver"; }; # Pour un VHost à partir d'un dossier
            "www.hackedserver.info" = vhost { root = "/var/www/hackedserver"; };
            "oraxen.com" = vhost { root = "/var/www/oraxen"; };
            "www.oraxen.com" = vhost { root = "/var/www/oraxen"; };
            "todo.oraxen.com" = vhost { root = "/var/www/oraxen/todo"; };
            #"code.litarvan.com" = vhost { locations."/".proxyPass = "http://localhost:7777/"; }; # Pour un VHost à partir d'un serveur local
            
        };
    };
}