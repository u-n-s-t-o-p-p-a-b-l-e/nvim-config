/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip
unzip Hermit.zip -d ~/.fonts
fc-cache -fv
echo "done!"
