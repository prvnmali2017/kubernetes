sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
sudo git clone https://github.com/jonmosco/kube-ps1.git
source kube-ps1/kube-ps1.sh
PS1='[\u@\h \W $(kube_ps1)]\$'
