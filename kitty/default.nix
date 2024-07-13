{ ... }:
{
  programs.kitty.settings = {
    background_opacity = "0.87";
    enable_audio_bell = false;
  };
  programs.kitty.extraConfig = builtins.readFile ./Nippon.conf;
}
