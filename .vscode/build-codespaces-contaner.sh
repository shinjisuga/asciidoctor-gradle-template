#
# build contaner for GitHub Codespaces
#
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install language-pack-ja graphviz fonts-noto* language-selector-common
sudo update-locale LANG=ja_JP.UTF8
echo 'export LANG=ja_JP.UTF-8' >> ~/.bashrc
export LANG=ja_JP.UTF-8
fc-cache -f
echo "#"
echo "# asciidoctor-gradle-template"
echo "#"
echo "# Setup Done! Build document here. (./gradlew docs)"
echo "#"
echo "# It will build correctly, if the following conditions 'OK'"
echo "#"
echo "#  Java(openjdk): $(java -version 2>&1 | grep openjdk >/dev/null && echo "OK")"
echo "#  Dialog Font(Noto Sans CJK JP): $(fc-match Dialog | grep 'Noto Sans CJK JP' >/dev/null && echo "OK")"
echo "#  LANG(ja_JP.UTF-8): $(echo $LANG | grep 'ja_JP.UTF-8' >/dev/null && echo "OK")"
echo "#"
