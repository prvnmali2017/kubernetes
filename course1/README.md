 ```
 minikube start
 eval `minikube docker-env`
        
 ``` 
## Pods
 
#### Quick guide
### Writing the Pod
  
`Reference API - <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/>`
  
  ```
 apiVersion: v1
kind: Pod
metadata:
  name: webapp
spec:
  containers:
  - name: webapp
    image: richardchesterwood/k8s-fleetman-webapp-angular:release0 %
  ```
  
### Applying the pod state
  
```
kubectl apply -f first-pod.yaml
kubectl get all
kubectl describe pod webapp
kubectl exec webapp ls
kubectl -it exec webapp sh
    wget http://localhost:80
    cat index.html
```
  
### Services

kubernetes/course1/first-service.yaml

```
kubectl apply -f first-service.yaml
