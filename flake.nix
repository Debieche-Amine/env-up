{
  description = "qylad-nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf/v0.8";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-openclaw = {
      url = "github:openclaw/nix-openclaw";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: {
    nixosConfigurations = {
      qylad-msi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "qylad";
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };

        modules = [
          ./hosts/qylad-msi
        ];
      };

      # test = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #
      #   specialArgs = {
      #     inherit inputs;
      #     username = "test";
      #   };
      #
      #   modules = [
      #     ./hosts/test
      #   ];
      # };

      vm-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "test";
        };

        modules = [
          ./hosts/vm-test
          "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
        ];
      };

      qylad-msi-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "qylad";
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };

        modules = [
          ./hosts/qylad-msi-vm
          "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
        ];
      };

      just-a-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "test";
        };

        modules = [
          ./hosts/just-a-vm
          "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
        ];
      };
    };

    packages.x86_64-linux = {
      vm-test = self.nixosConfigurations.vm-test.config.system.build.vm;
      just-a-vm = self.nixosConfigurations.just-a-vm.config.system.build.vm;
      qylad-msi-vm = self.nixosConfigurations.qylad-msi-vm.config.system.build.vm;
    };

    devShells =
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: let
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        esp32 = import ./shells/esp32.nix {pkgs = pkgs-unstable;};
        default = self.devShells.${system}.esp32;
      });

    templates = {
      esp32 = {
        path = ./templates/esp32;
        description = "ESP32 Rust minimal template";
      };
      default = self.templates.esp32;
    };
  };
}
