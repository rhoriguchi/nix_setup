# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cbff3e09-9eb3-4657-9944-2548823301c3";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/733E-56C4";
    fsType = "vfat";
  };

  fileSystems."/media/Data" = {
    device = "/dev/disk/by-uuid/2ef587d0-6f82-4715-a04f-2d1e6d5c7883";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/9b96f65f-fe9e-4166-8499-5589e8f723d4"; }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
