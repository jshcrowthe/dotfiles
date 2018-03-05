dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

pushd $dir

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/bundle
brew bundle

popd