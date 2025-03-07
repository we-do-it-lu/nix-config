{nixos-rk3588, ...}:
#############################################################
#
#  Aquamarine - A NixOS VM running on Proxmox
#
#############################################################
{
  imports = [
    # import the rk3588 module, which contains the configuration for bootloader/kernel/firmware
    nixos-rk3588.nixosModules.orangepi5
  ];

  networking = {
    hostName = "suzu"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = false;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    interfaces.end1 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.5.107";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = "192.168.5.201";
    nameservers = [
      "119.29.29.29" # DNSPod
      "223.5.5.5" # AliDNS
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
