{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.vesktop ];
      wayland.windowManager.hyprland.settings.bind = [
        "SUPER SHIFT, V, exec, Vesktop"
      ];
    };
}
