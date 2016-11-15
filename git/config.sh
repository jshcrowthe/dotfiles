echo "Cloning Github Repos"
mkdir $HOME/Repos;
pushd $HOME/Repos > /dev/null;

# Clone all of my Github Repos to my $HOME/Repos directory in parallel
for repo in $(curl https://api.github.com/users/jshcrowthe/repos | jq -r 'map(.full_name) | .[]'); do
  hub clone $repo &
done

# Wait for all of the background process' to end before continuing
wait;

popd > /dev/null;