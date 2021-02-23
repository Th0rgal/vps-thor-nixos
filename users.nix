{ pkgs, ... }: {

    nix.trustedUsers = [ "root" "thomas" ];

    users.users = {
        
        thomas = {
            isNormalUser = true;
            home = "/home/thomas";
            extraGroups = [ "wheel" ];
            shell = pkgs.fish;
            openssh.authorizedKeys.keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK"
            ];
        };
/*
        poyuterm = {
            isNormalUser = true;
            home = "/home/poyuterm";
            extraGroups = [];
            shell = pkgs.fish;
            openssh.authorizedKeys.keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK"
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwAYNOEVX7DG9nVoe/eR2sLbOATShKFpcwEqvnYUvyqkOS8FvzRDFzc2jNsV+uJIjN2gLtw6vY6MBYHoMbpPRLKOVsKRt+2rXE6KaAXH5UXqF2Pwygt4kV8FfUwIN7m4N0wGEPlI5+TH/UDCsNtmvmSSc/XM7sprxiZ/v5RgvA8hZf6AjMYI4yzZAl/9frv8X3p4jrNkIEW6mzq1NiF93w8NLEKpuUButN/GKcS4avbAbt+l7LQfjrLgJ+zACFTm9HCIt0miy05+ovLAXuHuCgpG1ehrm7xlJOu6FhbRqcEziZ5lhp9ZP+IB8G9BZEjqU7HbZyMR3PCIex6VsRDjax thomas@horus"
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9aZ7wBaUEkFHDd1QR6yJH3AbFOsoCpGRWBKgmcfNttBkHxrIJT8y9Qvv4UZyTLaU0ZGqxaS2LSCxf+4F8ll9o8X2wXnyN6CcvrzMiD3UHXvw9/gnlLOpyIIeYNCbdVsmEfsGqSSvfxvDou0GOSW8jtH/eOyRYv0Pbl1SO6CGDU6adTj2FuJNQLBy39yO2k/s7eVQBaD8CZGJyBgSmelPrZsCyZx4LBG6q97/LElMuhQ+Ft36f0MkFT+ljFCJqi2bqGbnDK9iDVrS2cCb7mPQTyOiLQizloQ0TT2xMMjnJX/Im+AwWNrsMfvZKXK8t8XzxlLQae2I5529ZruBIqQGkwKhearmn6pog40CGiq6/T7eatuhyxpZvt8q3T7IXlHRRl3HGA6hCwf0LpvK6v1Q1PQp4t+sKYdTUnKCkU44M+Rgc9keJvcLWWx5elfNrAqSM9FwtA3x5Vu2C8cZP8gPYqfCeifqZR9sIrpoUOo/TzLfmaGtNFoaIjzT59lPhzVyFg/h9aV/fQdN4hY0iu1aB3LVCPc7r8hsOfGdSJNbKmI2lGr+mdVHA8YStDvzuMtn/qHhD9KSujqggkReLFPue84e/IllDa28Fq+T/DLUgONECNWj2ALxpLmiaEQOgkjI8BJoBabyv4GH1ezy4zokOEnnIEqgX7dWy7lofeRYT3Q== valeranmaytie2@gmail.com"
            ];
        };*/

    };
}
