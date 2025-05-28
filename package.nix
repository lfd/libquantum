# Package can be build on CLI with:
#   nix build --impure --expr 'with import <nixpkgs> {}; (pkgs.callPackage ./package.nix {  })'
{
  lib,
  stdenv,

  meson,
  ninja,
  pkg-config,
  lapack,

  shared ? !stdenv.hostPlatform.isStatic,
  static ? false,
  splitStaticOutput ? shared && static,
}:

assert shared || static;

assert splitStaticOutput -> static;

stdenv.mkDerivation rec {
  pname = "libquantum";
  version = "2.0.0";

  src = ./.;

  nativeBuildInputs = [ meson ninja pkg-config ];
  buildInputs = [ lapack ];

  meta = {
    description = "C library for quantum computing and quantum simulation";
    homepage = "http://www.libquantum.de";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ bbenno ];
    pkgConfigModules = [ "quantum" ];
  };
}
