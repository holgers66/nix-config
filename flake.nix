{
  description = "Example multi-host, multi-user Darwin system flake with hostVars/userVars, using let-bindings and strict commas";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

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

  outputs = inputs@{ self, nix-darwin, home-manager, ... }:
    let
      ###################################
      # 1. Host variables
      ###################################
      hostVars = {
        host1 = {
          hostname = "Holgers-MacBook-Pro";
          arch = "aarch64-darwin";
          homeDirectory = "/Users/hschneider";
        };
      };

      ###################################
      # 2. User variables
      ###################################
      userVars = {
        userA = {
          username      = "hschneider";
          homeDirectory = "/Users/hschneider";
          shell         = "zsh";
        };
      };

      ###################################
      # 3. Base Darwin config function
      ###################################
      baseDarwinConfig = hostKey:
        { config, pkgs, ... }:
        {
          nixpkgs.hostPlatform = hostVars.${hostKey}.arch;

          system.stateVersion = 6;

          nix.extraOptions = ''
            experimental-features = nix-command flakes
          '';
          nix.package = pkgs.nix;
          nix.settings.experimental-features = "nix-command flakes";

          system.configurationRevision = self.rev or self.dirtyRev or null;

          nixpkgs.config.allowUnfree = true;
          nixpkgs.config.allowBroken = true;
        };
    in
    {
      ###################################
      # 4. Host 1: Holgers-MacBook-Pro
      ###################################
      darwinConfigurations."${hostVars.host1.hostname}" = let
        host1Base = baseDarwinConfig "host1";
      in
      nix-darwin.lib.darwinSystem {
        modules = [
          ({ pkgs, ... }: {
            _module.args = {
              username = "${userVars.userA.username}";
            };
          })
          host1Base
          ./modules/darwin/default.nix
          inputs.nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = userVars.userA.username;
              taps = {
                "homebrew/homebrew-core"   = inputs.homebrew-core;
                "homebrew/homebrew-cask"   = inputs.homebrew-cask;
                "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
                "argoproj/homebrew-tap"    = inputs.homebrew-argoproj;
              };
              autoMigrate = true;
              mutableTaps = true;
            };
          }
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;

            home-manager.users.${userVars.userA.username} = { pkgs, lib, ... }:
            {
              home.stateVersion = "24.11";
              home.homeDirectory = lib.mkForce (userVars.userA.homeDirectory);
              programs.zsh.enable  = (userVars.userA.shell == "zsh");
              programs.fish.enable = (userVars.userA.shell == "fish");
              imports = [
                ./modules/home/${userVars.userA.username}/default.nix
              ];
            };
          }
        ];
      };



      ###################################
      # 6. (Optional) Expose packages
      ###################################
      darwinPackages = {
        "${hostVars.host1.hostname}" = self.darwinConfigurations."${hostVars.host1.hostname}".pkgs;
      };
    };
}
