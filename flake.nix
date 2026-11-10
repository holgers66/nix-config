{
  description = "nix-darwin + home-manager configuration for Holgers-MacBook-Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-argoproj = {
      url = "github:argoproj/homebrew-tap";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nix-homebrew, ... }:
    let
      hostname = "Holgers-MacBook-Pro";
      system = "aarch64-darwin";
      username = "hschneider";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        # Available as module arguments in every darwin module
        specialArgs = { inherit inputs username; };

        modules = [
          {
            nixpkgs.hostPlatform = system;
            nixpkgs.config = {
              allowUnfree = true;
              allowBroken = true;
            };

            nix.settings.experimental-features = [ "nix-command" "flakes" ];

            system.stateVersion = 6;
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }

          ./modules/darwin
          nix-homebrew.darwinModules.nix-homebrew

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              # Move pre-existing unmanaged files aside (e.g. .zshrc -> .zshrc.hm-backup) instead of aborting
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit username; };
              users.${username} = import ./modules/home/${username};
            };
          }
        ];
      };

      # Expose the package set, e.g. `nix build .#darwinPackages.Holgers-MacBook-Pro.hello`
      darwinPackages.${hostname} = self.darwinConfigurations.${hostname}.pkgs;
    };
}
