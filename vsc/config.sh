dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

pushd "$dir" > /dev/null

packagesPath=`realpath .`

configPath=~/Library/Application\ Support/Code/User/snippets/
pushd "$configPath" > /dev/null;

ln -s $packagesPath/*.json .

popd

popd