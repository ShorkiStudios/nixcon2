{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.cavasik ];
    };
}
