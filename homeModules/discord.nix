_: {
  ## Webcord
  # Not in home-manager?
  # programs.webcord.enable = true;

  ## OFFICIAL CLIENT
  # Screenshare doesn't work at all
  # Video calls are iffy
  # Updates break things frequently
  # programs.discord.enable = true;

  ## VESKTOP
  # Dependency pnpm is insecure, refusing to build
  # programs.vesktop = {
  #   enable = true;
  #   vencord.settings = {
  #     autoUpdate = true;
  #     autoUpdateNotification = true;
  #     notifyAboutUpdates = true;
  #     plugins = {
  #       ClearURLs.enabled = true;
  #       FixYoutubeEmbeds.enabled = true;
  #     };
  #   };
  # };
}
