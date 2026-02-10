{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.strawberry ];
    };
}
