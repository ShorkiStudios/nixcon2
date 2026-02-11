{
  home =
    { color, ... }:
    {
      programs.fastfetch = {
        enable = true;
        settings = {
          logo = {
            source = "${./logo.txt}";
            type = "file";

            # REPLACE your current `color = let ...` with this:
            color = {
              "1" = "#FF218C";
              "2" = "#FF218C"; # pink
              "3" = "#FFD800";
              "4" = "#FFD800"; # yellow
              "5" = "#21B1FF";
              "6" = "#21B1FF"; # blue
            };
          };

          modules = [
            "title"
            "separator"
            "os"
            "host"
            "kernel"
            "uptime"
            {
              type = "command";
              key = "OS Age";
              text = ''
                birth=$(stat -c %W /)
                if [ "$birth" -le 0 ]; then
                  birth=$(stat -c %Y /etc/machine-id)
                fi
                now=$(date +%s)
                echo $(((now - birth) / 86400)) days
              '';
            }
            "packages"
            "shell"
            "display"
            "de"
            "wm"
            "terminal"
            "cpu"
            "gpu"
            "memory"
            "disk"
            "break"
            "colors"
          ];
        };
      };

      programs.bash.bashrcExtra = "fastfetch";
    };
}
