{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fluffychat ];
      # wayland.windowManager.hyprland.settings.bind = [
      # "SUPER, T, exec, Telegram"
      # ];
      # programs.niri.settings.binds."Mod+T".action.spawn = [ "Telegram" ];
    };
}
