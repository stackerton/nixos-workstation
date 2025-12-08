{ config, lib, pkgs, ... }: {

  programs.git = {
    enable = true;

    settings.user.name = "stacks";
    settings.user.email = "tbrown353@gmail.com";

    settings = {
      credential.helper = "store";
      init.defaultBranch = "main";

      core = {
        editor = "nvim";
        autocrlf = "input";
      };

      pull.rebase = true;
      push.autoSetupRemote = true;

    };
  };
} 
