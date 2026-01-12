{
  description = "Miguel's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      lib = nixpkgs.lib;

      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      forEachSystem = lib.genAttrs systems;
      mkPkgs = system: import nixpkgs { inherit system; };
    in
    {
      formatter = forEachSystem (
        system:
        let
          pkgs = mkPkgs system;
        in
        pkgs.nixfmt
      );

      homeManagerModules.default =
        { ... }:
        {
          home.file.".dotfile_zshrc".source = ./zsh/zshrc.symlink;
          home.file.".config/starship.toml".source = ./starship/config.toml;
        };
    };
}
