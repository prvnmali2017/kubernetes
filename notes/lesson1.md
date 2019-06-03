## Auto Completion
### Bash
source <(kubectl completion bash)
alias k=kubectl complete -o default -F __start_kubectl k 

### Zsh
ource <(kubectl completion zsh) 
alias kk=kubectl complete -o default -F __start_kubectl kk
