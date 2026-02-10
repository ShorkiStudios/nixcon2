{
  home =
    { userSettings, ... }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        includes = [
          {
            contents = {
              user = {
                name = userSettings.git.name;
                email = userSettings.git.email;
              };
            };
          }
        ];
      };
    };
}