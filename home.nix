{ config, pkgs, ... }:

{
  home.username = "brook";
  home.homeDirectory = "/home/brook";
  home.packages = with pkgs; [
    fastfetch
    nerdfetch
    cmatrix
    cowsay

    # Archives
    p7zip
    unzip
    xz
    zip

    # Utilities
    eza
    fzf
    neovim
    ripgrep
    starship
    zellij
    zoxide
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      c = "clear";
      q = "quit";
      zj = "zellij";
      ls = "eza -F --group-directories-first";
      ll = "ls --long --icons";
      la = "ls --all";
      lla = "ll --all";
      lt = "ls --tree";
      lta = "la --tree";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
