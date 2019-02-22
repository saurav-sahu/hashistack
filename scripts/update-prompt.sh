echo >> /home/vagrant/.bashrc
echo 'ipcommand () { 
 ifconfig enp0s8 | sed -n 2p | cut -d ":" -f 2 | cut -d " " -f 10
}' >> /home/vagrant/.bashrc
echo 'export PS1=`ipcommand`:$PS1' >> /home/vagrant/.bashrc
echo >> /home/vagrant/.bashrc

source /home/vagrant/.bashrc