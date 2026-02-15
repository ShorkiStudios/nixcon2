{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.vscodium ];
    };
}
