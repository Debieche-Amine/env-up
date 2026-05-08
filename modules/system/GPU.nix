{
  config,
  pkgs,
  ...
}: {
  # ============
  # 🖼️ NVIDIA GPU Support
  # ============

  # NVIDIA drivers are proprietary, but NixOS makes them easy to install.
  # These are required for hardware acceleration and optimal performance.

  # 🔍 Tip: If you're unsure which driver version you need (some cards require legacy versions),
  # visit: https://nixos.wiki/wiki/Nvidia

  # 💻 For laptops with Intel and NVIDIA GPUs (Optimus support)
  # hardware.nvidia.enable = true;  # Enable NVIDIA drivers for the NVIDIA GPU
  # hardware.nvidia.prime.enable = true;  # Enable Optimus for switching between Intel and NVIDIA GPUs
  # ⚠️ Do NOT enable modesetting for Optimus systems
  # hardware.nvidia.modesetting.enable = true;  # This should be left commented out for laptops with Optimus

  # 🖥️ For desktops with a single NVIDIA GPU
  # hardware.nvidia.enable = true;  # Enable the NVIDIA drivers for the NVIDIA GPU
  # hardware.nvidia.modesetting.enable = true;  # Enable modesetting for better performance
  # ✅ Uncomment the line below if you want to always use NVIDIA as the primary GPU
  # services.xserver.videoDrivers = [ "nvidia" ];  # Make NVIDIA the default graphics card

  # ⚙️ Optional: Use the stable version of NVIDIA drivers for reliability
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # ⚙️ Optional: Enable 32-bit libraries for older applications and games
  # hardware.nvidia.package = pkgs.linuxPackages.nvidia_x11;

  # END of Nvidia GPU Support
  # ============

  # my old setup

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      mesa # OpenGL support (for glxgears/glxinfo)
      intel-media-driver # VAAPI / video acceleration
      intel-vaapi-driver # Intel VAAPI bindings
    ];
  };
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;

  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;
    intelBusId = "PCI:0@0:2:0";
    nvidiaBusId = "PCI:2@0:0:0";
  };

  services.xserver.videoDrivers = ["nvidia" "modesetting"]; # "intel"
}
