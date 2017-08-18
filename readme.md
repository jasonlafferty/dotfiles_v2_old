How am I storing my dotfiles you ask:

Installing

```bash
git clone --bare git@github.com:jasonlafferty/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

My original dotfiles where based off

https://github.com/mathiasbynens/dotfiles

Time for me to move and optimise my dotfiles for my own needs.

Thanks to:

Nicola Paolucci:
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

Mathias Bynens:
My begining of my dotfiles :-)
https://github.com/mathiasbynens/dotfiles