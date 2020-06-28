{ stdenv, ats2 }:

stdenv.mkDerivation rec {
  pname = "ats-bitstream";
  version = "0.1";

  src = ./.;
  nativeBuildInputs = [ ats2 ];
  buildInputs = [ ];

  testPhase = ''
    make test
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp bin/libbitstream.a $out/bin
  '';

  meta = with stdenv.lib; {
    description = "Library for manipulation with bits as streams";
    longDescription = ''
      Small library that allows to write and read values as bits into buffer.
    '';
    homepage = "https://github.com/NCrashed/ats-bitstream";
    changelog = "https://github.com/NCrashed/ats-bitstream/CHANGELOG.md";
    license = licenses.mit;
    maintainers = [ "ncrashed@protonmail.com" ];
    platforms = platforms.all;
  };
}
