{ config, lib, pkgs, ... }:

{ 
  options = {
    programs.mprisence = {
      enable = lib.mkEnableOption "mprisence Discord Rich Presence";
      package = lib.mkPackageOption pkgs "mprisence" { };
      configFile = lib.mkOption {
        type = with lib.types; nullOr path;
        default = null;
      };
    };
  };

  config = lib.mkIf config.programs.mprisence.enable {
    environment.systemPackages = [ config.programs.mprisence.package ];

    systemd.user.services.mprisence = {
      enable = true;
      description = "mprisence Discord Rich Presence";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${config.programs.mprisence.package}/bin/mprisence";
        Restart = "always";
      };
      environment = lib.optionalAttrs (config.programs.mprisence.configFile != null) {
        MPRISENCE_CONFIG = config.programs.mprisence.configFile;
      };
    };
  };
}
