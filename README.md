# My .dotfiles :)

Usage:
```sh
# If you don't have git ssh: git clone --bare https://github.com/ArchGryphon9362/dotfiles $HOME/.dotfiles
git clone --bare git@github.com:ArchGryphon9362/dotfiles $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

# After you restart your terminal
gitc submodule update --init
gitc config status.showUntrackedFiles no
gitc config pull.rebase true
```

Now restart your terminal and enjoy (use kitty+zsh+ohmyzsh+nvim for the best experience)
