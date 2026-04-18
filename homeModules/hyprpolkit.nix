{ pkgs, ... }:
{
	home.packages = with pkgs; [
		hyprpolkitagent
	];

	services.hyprpolkitagent.enable = true;
}
