This will save me 90% of setting time, everytime I'm installing Neovim on new server.

How to install latest version of nvim:

Install Neovim from source

Download from github:
https://github.com/neovim/neovim/releases

Guide:
https://github.com/neovim/neovim/wiki/Installing-Neovim

make CMAKE_BUILD_TYPE=Release
sudo make install

If problem persist, please reboot your server/computer

Installing from terminal using apt or pkg manager will not work
with some plugins. Therefor need to install latest version.

After running nvim, run:
:PlugInstall
:UpdateRemotePlugins
:TSUpdate

Run npm install on coc files again if still showing errors

Finally run :Checkhealth and :Checkhealth Provider

If treesitters giving error, check this article:
https://stackoverflow.com/questions/70373650/how-to-solve-treesitter-highlighter-error-executing-lua-problem-in-neovim-confi


:TSInstall vim
:TSInstall c help lua vim

To learn about plugins I used, open init.vim and go to each plugins Github for documentation.
