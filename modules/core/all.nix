{
  deps =
    modules: with modules.core; [
      bootloader.default
      bluetooth
      boot-logging
      flatpak
      internationalisation
      kernel
      mounting
      networking
      nix
      power-management
      shebang-support
      sound
      state-version
      time
      user
    ];
}
