{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.gale ];
    };
}
