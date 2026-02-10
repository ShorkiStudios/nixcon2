{
  userSettings = {
    username = "shorki";
    git = {
      name = "Shorki";
      email = "shorkicalypso@gmail.com";
    };
  };

  baseStyle = {
    font = {
      size = 15;
      package = pkgs: pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Propo";
    };
    border = {
      thickness = 2;
      radius = 10;
    };
    spacing = 6;
  };

  systems = {
    barbados = {
      settings = {
        system = "x86_64-linux";
        timeZone = "America/Denver";
        locale = "en_US.UTF-8";
        monitor = {
          name = "eDP-1";
          settings = "1920x1080@60, 0x0, 1";
        };
      };
      styleOverrides = {
        font.size = 20;
      };
      modules =
        modules: with modules; [
          systems.barbados
          core.all
          de.all
          progs.audio.all
          progs.misc.all
          progs.coding.all
          progs.essential.all
          progs.networking.all
          progs.social.all
          progs.gaming.all
          progs.utils.all
          progs.virtualization.all
        ];
    };
  };
}
