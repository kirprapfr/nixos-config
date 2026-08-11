
{pkgs,inputs,...}:
{
  programs.firefox = {
    enable = true;

    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;

    preferences = {
      "widget.gtk.libadwaita-colors.enabled" = false;
    };
  };
}
