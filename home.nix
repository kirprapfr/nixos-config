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
    mpv
    fastfetch
  ];

  #NEMO
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };

  #DOTFILES
  xdg.configFile."spicetify".source = ./spicetify;
  xdg.configFile."kitty".source = ./kitty; 
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua".source = ./nvim/lua;
  xdg.configFile."hypr".source = ./hypr;
}
