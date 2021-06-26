## My personal dotfiles

### Installing
* Install [stow](https://www.gnu.org/software/stow/). Preferably build from source, because not all packagemanagers have the latest version.
* Clone repo to a folder in your home folder.
* Change directory to `dotfiles` and then run stow to link all config files.
Like this:

```
cd ~/ && git clone git@github.com:GDay/dotfiles.git && cd dotfiles && stow */
```
