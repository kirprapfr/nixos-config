{inputs,pkgs,...}:
{
  environment.systemPackages = [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}
