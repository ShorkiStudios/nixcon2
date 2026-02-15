{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fluffychat ];
      wayland.windowManager.hyprland.settings.bind = [
        "SUPER, F, exec, FluffyChat"
      ];
    };
}
