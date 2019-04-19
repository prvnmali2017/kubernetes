#!/bin/bash
wget https://github.com/coreos/etcd/releases/download/v3.2.0/etcd-v3.2.0-linux-amd64.tar.gz
tar xvf etcd-v3.2.0-linux-amd64.tar.gz
sudo mv etcd-v3.2.0-linux-amd64/etcd* /usr/local/bin/
ETCDCTL_API=3 etcdctl snapshot save snapshot.db --cacert /etc/kubernetes/pki/etcd/server.crt --cert /etc/kubernetes/pki/etcd/ca.crt --key /etc/kubernetes/pki/etcd/ca.key
ETCDCTL_API=3 etcdctl --write-out=table snapshot status snapshot.db
sudo tar -zcvf etcd.tar.gz etcd
