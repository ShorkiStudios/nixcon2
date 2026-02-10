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
      version = "0.1.120";

      src = fetchCrate {
        inherit pname version;
        sha256 = "sha256-FQkDoLsS58Z3QaOlzUGSIvkzH1kpqQc5BozL8x27Bxk=";
      };

      cargoHash = "sha256-2FRCCMZuhuvbW5s0rNyEuMYJ2a48uQ1xAl1p/WDG5co=";

      doCheck = false;

      meta = with lib; {
        description = "Freenet node and tooling";
        homepage = "https://github.com/freenet/freenet-core";
        license = licenses.agpl3Only;
        platforms = platforms.linux;
      };
    };
}
