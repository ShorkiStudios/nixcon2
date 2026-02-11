{
  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.quodlibet-full ];
    };
}
