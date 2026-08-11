{inputs,config,pkgs,...}:
{
  imports = [
    # For home-manager
    inputs.spicetify-nix.homeManagerModules.default 
  ];


  services.spotifyd = {
    enable = true;
  };
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];
  
    theme = spicePkgs.themes.sleek;
    colorScheme = "Psycho";
  };
  xdg.desktopEntries.spotify = {
    name = "Spotify";
    exec = "spotify";
    icon = "spotify";
    comment = "Music streaming";
    categories = [ "Audio" "Music" ];
    terminal = false;
  };
}
