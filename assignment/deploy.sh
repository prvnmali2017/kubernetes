#!/bin/bash
kubectl get nodes > /tmp/test.txt
kubectl create -f services/
