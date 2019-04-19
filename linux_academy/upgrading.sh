#!/bin/bash
export VERSION=$(curl -sSL https://dl.k8s.io/release/stable.txt)
export ARCH=amd64
echo $VERSION
##Latest version of kubernetes
curl -sSL https://dl.k8s.io/release/${VERSION}/bin/linux/${ARCH}/kubeadm > kubeadm
sudo install -o root -g root -m 0755 ./kubeadm /usr/bin/kubeadm
sudo kubeadm version
sudo kubeadm upgrade plan
kubeadm upgrade apply v1.14.1
diff kube-controller-manager.yaml /etc/kubernetes/manifests/kube-controller-manager.yaml
curl -sSL https://dl.k8s.io/release/${VERSION}/bin/linux/${ARCH}/kubelet > kubelet
sudo install -o root -g root -m 0755 ./kubelet /usr/bin/kubelet
sudo systemctl restart kubelet.service
kubect get nodes -w
