
# keyd commands

sudo systemctl enable keyd
sudo systemctl start keyd
sudo keyd reload
sudo keyd monitor
sudo systemctl status keyd.service


# config file located at: /etc/keyd/default.conf
# backspace+escape+enter should cause keyd to terminate.
# sudo journalctl -eu keyd
