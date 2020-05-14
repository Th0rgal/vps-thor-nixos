{ pkgs, ... }: {
    users.users.thomas = {
        isNormalUser = true;
        home = "/home/thomas";
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8dN3vkN5rbgA5L7o70kQf6h5MGM1/KOBE7tcXL1KRYRGdUPF5Mm8rGmmlY2SceZ4BzPOh3vMTBVWNMRf3+gjvdcNXJEqrFNCDz3CKWU8C/bYMI5iS/ANAb5CAavf92t0riAkm8HNT1PUTey/7UFYdshJARTAVhfUlAzLE4MSERd10D0BgGbYWZdhn3M1H//rBGERNwOTqpImlgRp/r+LHWr2QH3V5xwdosNfknfk6OeoPnRC4KHAtWUwqUBA4FKMTe99oLpa9sNAw0JSx3l0xmJRakOrZgdke08BCu9cqC9K2jEWVzDBoorAlHm8XtJYQlOZCQgfWof2vkjXe+CTH julien@UX410UAR" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK" ];
    };
}
