source $stdenv/setup

mkdir -p $out/{bin,share/java}

# # -- Build from source (tla.zip)
# unzip $src
# cd tla
# javac ...
# jar cfv tla2tools.jar $(find . -name \*.class)
# mv tla2tools.jar $out/share/java

# -- Build from jar (tla2tools.jar)
cp $src $out/share/java/tla2tools.jar

# -- Install executable
# tlc
cat > $out/bin/tlc <<EOF
#! $shell
exec $JAVA -classpath $out/share/java/tla2tools.jar tlc2.TLC "\$@"
EOF
chmod a+x $out/bin/tlc

# sany
cat > $out/bin/sany <<EOF
#! $shell
exec $JAVA -classpath $out/share/java/tla2tools.jar tla2sany.SANY "\$@"
EOF
chmod a+x $out/bin/sany

# pcal2tla
cat > $out/bin/pcal2tla <<EOF
#! $shell
exec $JAVA -classpath $out/share/java/tla2tools.jar pcal.trans "\$@"
EOF
chmod a+x $out/bin/pcal2tla

# tla2tex
cat > $out/bin/tla2tex <<EOF
#! $shell
exec $JAVA -classpath $out/share/java/tla2tools.jar tla2tex.TLA "\$@"
EOF
chmod a+x $out/bin/tla2tex
