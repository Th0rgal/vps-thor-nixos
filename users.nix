{ pkgs, ... }: {
    users.users.thomas = {
        isNormalUser = true;
        home = "/home/thomas";
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcVl0JGuR8XLj2xnGhHqazghmuQWAFdxVVMOyQdYqJSp1MSWnRwQ7uaLGfBnahBzxlw92VLrcuG20rfGHH8EFy/WU7kG0BFGbjLiPtUQdN+XHu9469haJjqCm6Uol0Dj/dnM7XbQlhRal/h2iYtxZIIbPr3quSrmvqu3fZxJ5LNtlqW9J6h8aC9g3iz6nzXzZVY5c7URZQxWnBUVx4z5haHqUkSwCmUyrE6cAsWSMH9gR/8zvYg4sbh5iRRUgt1EOlgANDaKabCd6Ee5g9v54E9svoQEzD03qKgbMIV2cFc88KgfKXgEyUK6A0tEwGb2KILdIJeU/Z4bSUPqdbnDdx thoma@DESK"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTKaynG1UzaX/4YyYq4i4cKoBgZDB3CQ8vNZO8QupiK5HZGKsELQq6BKIqDiKlfTRmNhwY+/KF+gV6QBqozqL7uj1COzvO02NJsRZgENx2sQQnTNSuzOp9BbMTgjgpf3TelomdU4yrnn+FEuda5WMLgxhn/g8bLGU04tIyxRF6zEbatOYi2dUri/h6ZbCYF3EKyDM9OOJ8pU4Se4+RHtX2UyBNwrVOoymegf0ts6tAiBSxsolSu1L9mUnINJvlJfmiv2dWVpAj6XEOJFdoqwJAab7X1ydYee2PgBdxqptyu/Rbq4JCdLs4pa3HR04TmKP5r9T4PaqhKljlYvLNlMYD"
        ];
    };
}