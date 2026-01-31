{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      home-manager,
      ...
    }:
    let
      params = import ./params.nix;
      inherit (params) system hostName userName;

      hmBaseModules = [ ./home/base.nix ];
      hmExtraModules = [ ./home/extra.nix ];

      osModules = [
        nixos-wsl.nixosModules.default
        ./configuration.nix
      ];

      hmAsNixosModule = [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${userName}.imports = hmBaseModules;
        }
      ];

      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit (params) userName; };
        modules = osModules ++ hmAsNixosModule;
      };
    in
    {
      nixosConfigurations.${hostName} = nixos;

      homeConfigurations.${userName} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixos.pkgs;
        extraSpecialArgs = { inherit (params) userName; };
        modules = hmBaseModules ++ hmExtraModules;
      };
    };
}
