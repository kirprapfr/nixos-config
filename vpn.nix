
{pkgs,...}:
{
  environment.systemPackages = [
    pkgs.proton-vpn
    pkgs.i2p
  ];
}
