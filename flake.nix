{
	description = "Darwin system flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ nixpkgs, nix-darwin, ... }: {
		darwinConfigurations = {
# 这里写主机名
			yanfansongdeMacBook-Pro = nix-darwin.lib.darwinSystem {
				system = "aarch64-darwin";
				modules = [
					./configuration.nix
				];
			};
		};
	};
}

