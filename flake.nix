{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    firefox = {
    url = "github:nix-community/flake-firefox-nightly";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, 
  nixpkgs,
  home-manager, 
  spicetify-nix, 
  ... 
  }

  @inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	    specialArgs = {
	      inherit inputs;
	    };
        modules = [
          ./configuration.nix
	    home-manager.nixosModules.default
	    {
              home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; }; #If you want access to inputs in your home.nix
              users.mani = ./home.nix; # replace <USERNAME> with your actual username
              backupFileExtension = "backup";
              };

          }
          ./flatpak.nix  
      	  ./prismlauncher.nix
  	  ./firefox.nix
        ];
      };
    };
  };
}

