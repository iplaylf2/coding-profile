{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
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

      inherit (params)
        stateVersion
        system
        hostname
        username
        ;
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username stateVersion; };
        modules = [
          nixos-wsl.nixosModules.default
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${username} = ./home.nix;

            home-manager.extraSpecialArgs = {
              inherit username stateVersion;
            };
          }
        ];
      };
    };
}
