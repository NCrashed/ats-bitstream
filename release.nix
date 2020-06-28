let
  pkgs = import ./nix/pkgs.nix { inherit config; };
  config = {
    packageOverrides = new: rec {
      ats2 = new.callPackage ./nix/compiler {};
      ats-bitstream = new.callPackage ./ats-bitstream {};
    };
  };
in {
  inherit pkgs;
  shell = pkgs.ats-bitstream;

  packages = {
    inherit (pkgs) ats-bitstream;
  };
}
