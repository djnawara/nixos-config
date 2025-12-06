{
  description = "Daveloper's flake";

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      home-manager,
      plasma-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        daveloper-nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./configuration.nix
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                users.dave = import ./modules/home/home.nix;
              };
            }
          ];
        };
      };
    };
}
