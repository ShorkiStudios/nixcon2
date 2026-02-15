{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fediwall-unwrapped ];
    };
}
