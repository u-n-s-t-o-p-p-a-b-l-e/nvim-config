# Neovim Installation

This will save me 90% of setting time, everytime I'm installing Neovim on new server. 
(This is not dotfiles, just another way to do it)
<br />

How to install latest version of nvim:

Install Neovim from source

Download from github:
https://github.com/neovim/neovim/releases

Guide:
https://github.com/neovim/neovim/wiki/Installing-Neovim
```

make CMAKE_BUILD_TYPE=Release
sudo make install
```

If problem persist, please reboot your server/computer

Installing from terminal using `apt` or pkg manager will not work
with some plugins because it will not install the latest version. 
Therefore need to install latest version using the guide above.

<br />
<hr />

### Usage
Create folder nvim inside .config folder:
```
cd .config
mkdir nvim
```
Copy + paste init.vim inside nvim folder created:
```
cd nvim
mv /path/to/file/init.vim .
```
<br />
Before run the script, make sure to change its permission:
```
cd /path/to/files
chmod +x *
```

After running nvim, in `normal` mode, run:
`:PlugInstall`
`:UpdateRemotePlugins`
`:TSUpdate`

Run `npm install` within coc folder again if still showing errors. You can find this folder in .local directory:
```
cd .local/share/nvim/plugged/coc.nvim
npm install
```



Finally run `:Checkhealth` and `:Checkhealth Provider`

<br />
<br />

### Troubleshooting

If treesitters giving error, check this article:
https://stackoverflow.com/questions/70373650/how-to-solve-treesitter-highlighter-error-executing-lua-problem-in-neovim-confi
<br />
<hr />
<br />
This are example to install language server, also helping fixing chechkhealth errors:
`:TSInstall vim`
`:TSInstall c help lua vim`

To learn about plugins I used, open init.vim and go to each plugins Github for documentation.
