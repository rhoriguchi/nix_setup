[
  (self: super: {
    mach-nix = super.callPackage ./mach-nix.nix { pkgs = super; };
    python3 = super.callPackage ./python3 { inherit (super) python3; };
  })
  (self: super: {
    glances = super.callPackage ./glances.nix { inherit (super) glances; };
    gnomeExtensions =
      super.callPackage ./gnomeExtensions { inherit (super) gnomeExtensions; };
    log2ram = super.callPackage ./log2ram.nix { };
    mal_export = super.callPackage ./mal_export.nix { };
    resilio-sync =
      super.callPackage ./resilio-sync.nix { inherit (super) resilio-sync; };
    terraform =
      super.callPackage ./terraform.nix { inherit (super) terraform; };
    tv_time_export = super.callPackage ./tv_time_export.nix { };
  })
]
