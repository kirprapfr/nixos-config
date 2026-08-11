{ inputs,config, pkgs, ... }:
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  imports = [
    ./spotify.nix
  ];


  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  #PACKAGES
  home.packages = with pkgs; [
    gcc
    gnumake
    wl-clipboard
    ripgrep
    fd
    lazygit
    bottom
    nodejs
    python3
    nerd-fonts.geist-mono
  ];


  #DOTFILES
  home.file.".config/spicetify".source = ./spicetify;
  home.file.".config/kitty".source = ./kitty; 
  home.file.".config/nvim".source = ./nvim;
  home.file.".config/hypr".source = ./hypr;
  home.file.".config/rofi".source = ./rofi;
}
