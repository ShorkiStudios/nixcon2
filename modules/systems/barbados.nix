{
  os =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "ahci"
        "nvme"
        "uas"
        "usbhid"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-label/root";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      services.fprintd.enable = true;
      services.fprintd.tod.enable = true;
      services.fprintd.tod.driver = pkgs.libfprint-2-tod1-elan;

      security.pam.services = {
        sudo = {
          fprintAuth = true;
          unixAuth = true;
        };
        login = {
          fprintAuth = false;
          unixAuth = true;
        };
        polkit-1 = {
          fprintAuth = true;
          unixAuth = true;
        };
        hyprlock = {
          fprintAuth = false;
          unixAuth = true;
        };
      };
    };
}
