{ pkgs, lib, config, ... }: {

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

        virtualHosts = let
        vhost = config: lib.mkMerge [
            ({
            http2 = true;
            enableACME = true;
            forceSSL = true;
            extraConfig = ''
                charset UTF-8;
            '';
            })
            config
        ];
        in {
            "hackedserver.info" = vhost { root = "/var/www/hackedserver"; };
            "www.hackedserver.info" = vhost { root = "/var/www/hackedserver"; };
            "oraxen.com" = vhost { root = "/var/www/oraxen"; };
            "www.oraxen.com" = vhost { root = "/var/www/oraxen"; };
            "todo.oraxen.com" = vhost { root = "/var/www/oraxen/todo"; };
            "goblinmc.fr" = vhost {
            root = "/var/www/goblinmc";
            locations."/".index = "index.php";
           
            locations."~ \.php$".extraConfig = ''
                # Ce qui commence par un # est inutile
                # fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:${config.services.phpfpm.pools.mineweb_website.socket};
                fastcgi_index index.php;
                # include ${pkgs.nginx}/conf/fastcgi_params;
                # include ${pkgs.nginx}/conf/fastcgi.conf;
            '';
            };
            #"code.litarvan.com" = vhost { locations."/".proxyPass = "http://localhost:7777/"; }; # Pour un VHost à partir d'un serveur local
        };
    };

    services.phpfpm = {

        pools = let pool = poolConfig: (poolConfig // {
            settings = {
            "listen.owner" = config.services.nginx.user;
            "pm" = "dynamic";
            "pm.max_children" = 32;
            "pm.max_requests" = 500;
            "pm.start_servers" = 2;
            "pm.min_spare_servers" = 2;
            "pm.max_spare_servers" = 5;
            "php_admin_value[error_log]" = "stderr";
            "php_admin_flag[log_errors]" = true;
            "catch_workers_output" = true;
            };
            phpEnv."PATH" = lib.makeBinPath [ pkgs.php ];
        }); in {
            "mineweb_website" = pool { user = "mineweb_website"; };
        };
    };

  users.users.mineweb_website = {
    isSystemUser = true;
    createHome = true;
    home = "/var/www/goblinmc";
    group  = "mineweb_website";
  };
  users.groups.mineweb_website = {};

}
