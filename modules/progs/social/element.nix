{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.element-desktop ];
      wayland.windowManager.hyprland.settings.exec-once = [
        "element-desktop"
      ];
    };
}
