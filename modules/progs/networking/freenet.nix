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
      version = "0.1.121";

      src = fetchCrate {
        inherit pname version;
        sha256 = "sha256-TrYsiirL/LDrxj78jNK6DN4LPhfQXZDk4ENkWo7DzMI=";
      };

      cargoHash = "sha256-WKN4P+fbdoLimx/1nrIvCxFFfPLd1tmGsYvy5CJoINA=";

      doCheck = false;

      meta = with lib; {
        description = "Freenet node and tooling";
        homepage = "https://github.com/freenet/freenet-core";
        license = licenses.agpl3Only;
        platforms = platforms.linux;
      };
    };
}
