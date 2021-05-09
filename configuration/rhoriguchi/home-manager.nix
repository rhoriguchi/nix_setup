{
  imports = [
    (let
      commit = "15a2953c814efd5280f121d802c510d26ca15726";
      sha256 = "1shybb4sv4y3d3wq6j2f3b3896z289lj0np6rhd7y2ykn46i29nl";
    in "${
      fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/${commit}.tar.gz";
        inherit sha256;
      }
    }/nixos")
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.rhoriguchi = {
      news.display = "silent";

      manual = {
        html.enable = false;
        json.enable = false;
      };
    };
  };
}
