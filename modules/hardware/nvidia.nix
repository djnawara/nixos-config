{ config, ... }:

{
  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        sync.enable = true;

        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:10:0:0";
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia"];
}
