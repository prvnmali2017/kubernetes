We have set up a cluster in an Ubuntu environment, but it's a good idea to know how to install Kubernetes in a variety of envrionments. In this lesson, we will briefly go through how to bootstrap a cluster using CentOS 7 servers. After completing thia lesson, you will have some hands-on experience installing Kubernetes in an environment other than Ubuntu.

Here are the commands used in this lesson. Feel free to use them as a reference, or just use them to follow along!

Turn off swap on all servers.

```sudo swapoff -a
sudo vi /etc/fstab
```
Look for the line in /etc/fstab that says /root/swap and add a # at the start of that line, so it looks like: #/root/swap. Then save the file.

Install and configure Docker.

```sudo yum -y install docker
sudo systemctl enable docker
sudo systemctl start docker
```
Add the Kubernetes repo.

```cat << EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
```
Turn off selinux.

```sudo setenforce 0
sudo vi /etc/selinux/config
Change the line that says SELINUX=enforcing to SELINUX=permissive and save the file.
```
Install Kubernetes Components.

```sudo yum install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet
sudo systemctl start kubelet
Configure sysctl.
```

```cat << EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
```

```sudo sysctl --system
```
Initialize the Kube Master. Do this only on the master node.

```sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
Install flannel networking.

```kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
```

The kubeadm init command that you ran on the master should output a kubeadm join command containing a token and hash. You will need to copy that command from the master and run it on all worker nodes with sudo.

```sudo kubeadm join $controller_private_ip:6443 --token $token --discovery-token-ca-cert-hash $hash
```
Now you are ready to verify that the cluster is up and running. On the Kube Master server, check the list of nodes.

kubectl get nodes
It should look something like this:

```NAME                      STATUS   ROLES    AGE     VERSION
wboyd4c.mylabserver.com   Ready    master   3m36s   v1.12.2
wboyd5c.mylabserver.com   Ready    <none>   23s     v1.12.2
Make sure that all of your nodes are listed and that all have a STATUS of Ready.
```
