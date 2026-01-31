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
      nixpkgs,
      nixos-wsl,
      home-manager,
      ...
    }:
    let
      params = import ./params.nix;
      inherit (params) system hostName userName;

      stateVersion = "25.11";

      hmBaseModules = [
        { home.stateVersion = stateVersion; }
        ./home/base.nix
      ];
      hmExtraModules = [ ./home/extra.nix ];

      osModules = [
        nixos-wsl.nixosModules.default
        { system.stateVersion = stateVersion; }
        ./configuration.nix
      ];

      extraSpecialArgs = { inherit (params) userName; };

      hmAsNixosModule = [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${userName}.imports = hmBaseModules;
          home-manager.extraSpecialArgs = extraSpecialArgs;
        }
      ];
    in
    {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit (params) userName proxy; };
        modules = osModules ++ hmAsNixosModule;
      };

      homeConfigurations.${userName} = home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs;
        modules = hmBaseModules ++ hmExtraModules;
      };
    };
}
