# Run Install Scripts
 for installScript in */install.sh ; do
   echo "\r\n====================================================";
   echo "============== Running $installScript ==============";
   echo "====================================================\r\n";
   ./$installScript
 done

# Symlink Dotfiles
 echo "\r\n====================================================";
 echo "================ Symlinking Dotfiles ===============";
 echo "====================================================\r\n";
 files=`find . -name ".[^.]*" ! -path ./.git ! -path ./.gitignore`;
 for relativePath in $files ; do
   dotfile=`echo "$relativePath" | sed 's@.*/@@'`;
   echo "Linking $dotfile";
   srcPath=`realpath $relativePath`;
   destPath=~/$dotfile;
   if [ ! -e $destPath ]
   then
     ln -s $srcPath $destPath;
   else
     read -p "$dotfile exists overwrite? [y/n]:" -n 1 -r
     if [[ $REPLY =~ ^[Yy]$ ]]
     then
       rm $destPath;
       ln -s $srcPath $destPath;
     fi
   fi
 done

# Run Config Scripts
for configScript in */config.sh ; do
  echo "\r\n====================================================";
  echo "=============== Running $configScript ==============";
  echo "====================================================\r\n";
  ./$configScript
done