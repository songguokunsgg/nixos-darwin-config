{pkgs, ... }: 

{
# 软件包设置
	environment.systemPackages = with pkgs; [
		neovim
			nodejs_22
			corepack_22 # include pnpm npm yarnpkg
			rustup
			fastfetch
			lua
			tree
			tmux
			wget
	];

	programs.zsh.enable = true;

	services.nix-daemon.enable = true;
	nix.settings = {
		experimental-features = "nix-command flakes";
# extra-platforms = "aarch64-darwin x86_64-darwin";
	};
	system.stateVersion = 4;
	nixpkgs.hostPlatform = "aarch64-darwin";
}
