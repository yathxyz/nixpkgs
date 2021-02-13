{ stdenv, fetchurl, pkgconfig, ffmpeg, libxslt }:

stdenv.mkDerivation rec {
  pname = "unpaper";
  version = "6.1";

  src = fetchurl {
    url = "https://www.flameeyes.eu/files/${pname}-${version}.tar.xz";
    sha256 = "0c5rbkxbmy9k8vxjh4cv0bgnqd3wqc99yzw215vkyjslvbsq8z13";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ ffmpeg libxslt ];

  meta = with stdenv.lib; {
    homepage = "https://www.flameeyes.eu/projects/unpaper";
    description = "Post-processing tool for scanned sheets of paper";
    license = licenses.gpl2;
    platforms = platforms.all;
    maintainers = [ maintainers.rycee ];
  };
}
