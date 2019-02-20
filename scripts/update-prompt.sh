echo >> ~/.bashrc
echo 'IP=$(ifconfig enp0s8 | sed -n 2p | cut -d ":" -f 2 | cut -d " " -f 1)' >> ~/.bashrc
echo 'export PS1=$IP:$PS1' >> ~/.bashrc
echo >> ~/.bashrc 

source ~/.bashrc