{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.stoat-desktop ];
    };
}
