{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "flaming-monocle";
        email = "kobi.l.oreilly@gmail.com";
      };
      credential.helper = "libsecret";
      init.defaultBranch = "main";
    };
  };
}
