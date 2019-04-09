echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
complete -F __start_kubectl k
alias k="kubectl"
alias kgd="k get deploy"
alias kgp="k get pods"
alias kgn="k get nodes"
alias kgs="k get svc" 
alias kge="k get events — sort-by='.metadata.creationTimestamp' |tail -8"

export nks="-n kube-system" 
export ETCDCTL_API=3
export k8s="https://k8s.io/examples"

function vaml()
{
 vim -R -c 'set syntax=yaml' -; 
}
