{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fluffychat ];
      wayland.windowManager.hyprland.settings.bind = [
        "SUPER, F, exec, FluffyChat"
      ];
      # programs.niri.settings.binds."Mod+T".action.spawn = [ "Telegram" ];
    };
}
