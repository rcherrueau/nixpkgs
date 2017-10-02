{ stdenv, fetchurl, jdk, unzip }:

# See https://nixos.org/nixpkgs/manual/#chap-quick-start
# See https://static.domenkozar.com/nixpkgs-manual-sphinx-exp/stdenv.xml.html
# At the top of nixpkgs do:
# > nix-build -A tlaplus-tools # to test good build
# > nix-env -f . -iA tlaplus-tools # to install
stdenv.mkDerivation {
  name = "tlaplus-tools";

  src = fetchurl {
    url = "https://tla.msr-inria.inria.fr/tlatoolbox/dist/tla2tools.jar";
    sha256 = "1hblany16w1zm7xinyg3az39hgpsax5iqghapwbrwk8ygf2hnh55";
  };

  buildInputs = [ jdk unzip ];
  builder = ./builder.sh;
  JAVA = "${jdk.jre}/bin/java";

  meta = {
    description = "Tools for TLA+ specification language";

    longDescription = ''
      TLA+ is a language for writing TLA specifications. See the TLA
      web page or the book Specifying Systems to find out about TLA
      and TLA+. A new TLA+ Hyperbook is being written. It provides
      what is hopefully a gentler introduction to TLA+. There are four
      TLA+ tools available, each described with its own web page:

      The SANY Syntactic Analyzer (sany)
        A parser and syntax checker for TLA+ specifications.

      TLC (tlc)
        A model checker and simulator for a subclass of "executable"
        TLA+ specifications.

      The PlusCal Translator (pcal2tla)
        A translator from the PlusCal algorithm language to TLA+.

      TLATeX (tla2tex)
        A program for typesetting TLA+ specifications.
    '';

    homepage = http://lamport.azurewebsites.net/tla/tools.html;

    platforms = stdenv.lib.platforms.unix;

    # For the license, tla.zip says MSR-EULA, but Lamport website says MIT, 
    # http://lamport.azurewebsites.net/tla/license.html
    license = stdenv.lib.licenses.mit;
  };
}
