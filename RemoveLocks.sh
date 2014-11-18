echo Search and Destroy of all lock files we have access to
rm -rf *.cdslck

find . -name '*.cdslck' -exec rm {} \;
find . -name '*.oacache' -exec rm {} \;

