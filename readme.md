# Dotfiles

This is where my dotfiles live.

Settings for:

- Vim (editor)
- Zsh (shell and Oh My Zsh!)
- [Hyper](https://hyper.is)

---

## Install

```sh
git clone --depth=1 https://github.com/giovannimariacusaro/dotfiles
cp -r ./dotfiles/.zshrc ~/
cp -r ./dotfiles/.vimrc ~/
cp -r ./dotfiles/.hyper.js ~/
cp -r ./dotfiles/.hushlogin ~/
rm -rf ./dotfiles/
```

## Warning

If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!
