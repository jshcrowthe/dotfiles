dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

pushd "$dir" > /dev/null

packagesPath=`realpath .`

configPath=~/Library/Application\ Support/Code/User/

# Script pulled from https://ubuntuforums.org/showthread.php?t=798899

SRC="$packagesPath/config"
DEST="$configPath"

mkdir -p $DEST 

## 1 - recreate SRC directory tree as DEST
find $SRC -type d |while read PATHNAME; do 
    mkdir -p "$DEST${PATHNAME#$SRC}" ; 
done

## 2 - create a a symlink under $DEST for each file under $SRC
find $SRC -type f |while read PATHNAME; do 
        NEW="$DEST${PATHNAME#$SRC}" ; 
        echo "$NEW" ; 
        ln -s "$PATHNAME" "$NEW" ; 
done

popd

code --install-extension PKief.material-icon-theme --install-extension formulahendry.code-runner --install-extension ms-vscode.sublime-keybindings