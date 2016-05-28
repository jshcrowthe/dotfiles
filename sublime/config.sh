dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

pushd "$dir" > /dev/null

packagesPath=`realpath ./Packages`

configPath=~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages;
pushd "$configPath" > /dev/null;

curl -o "Package Control.sublime-package" https://sublime.wbond.net/Package%20Control.sublime-package
cp -r $packagesPath/* ../Packages

popd

popd
