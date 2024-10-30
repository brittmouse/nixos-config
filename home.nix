{ config, pkgs, ... }:

{
  home.username = "brook";
  home.homeDirectory = "/home/brook";
  home.packages = with pkgs; [
    fastfetch
    hyfetch
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
    gcc
    gitui
    gnumake
    lazygit
    ripgrep
    starship
    xclip
    zellij
    zoxide

    # Text Editors
    emacs
    neovim

    # GUI Applications
    kitty
    libreoffice
    vesktop
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      c = "clear";
      q = "exit";
      zj = "zellij";
      ls = "eza -F --group-directories-first";
      ll = "ls --long --icons";
      la = "ls --all";
      lla = "ll --all";
      lt = "ls --tree";
      lta = "la --tree";
    };
    initExtra = ''
      export PATH="$PATH:$HOME/.config/emacs/bin"
      '';
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
