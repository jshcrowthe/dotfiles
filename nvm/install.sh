version=`curl -Ls -o /dev/null -w %{url_effective} https://github.com/creationix/nvm/releases/latest | sed 's@.*/@@'`

echo "Download NVM $version";
curl -o- "https://raw.githubusercontent.com/creationix/nvm/$version/install.sh" | bash
