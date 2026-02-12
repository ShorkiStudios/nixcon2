{
  os =
    { pkgs, allModules, ... }:
    {
      systemd.services.freenet = {
        enable = true;
        path = [ (pkgs.callPackage allModules.progs.networking.freenet.package { }) ];
        script = "freenet";
      };

    };
  home =
    { pkgs, allModules, ... }:
    {
      home.packages = [
        (pkgs.callPackage allModules.progs.networking.freenet.package { })
      ];
    };

  package =
    {
      rustPlatform,
      fetchCrate,
      lib,
    }:
    rustPlatform.buildRustPackage rec {
      pname = "freenet";
      version = "0.1.124";

      src = fetchCrate {
        inherit pname version;
        sha256 = "sha256-tnriRHdbvH4+29ruN9s+e0+96V33FC1z3eO3X57XNVI=";
      };

      cargoHash = "sha256-voe66fnLgEisvWeaq9e6Il7Ymrz2LgXDYRgq2qbylWY=";

      doCheck = false;

      meta = with lib; {
        description = "Freenet node and tooling";
        homepage = "https://github.com/freenet/freenet-core";
        license = licenses.agpl3Only;
        platforms = platforms.linux;
      };
    };
}
