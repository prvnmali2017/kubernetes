 ```
 minikube start
 eval `minikube docker-env`
        
 ``` 
 
## Pods
 
#### Quick guide
 
 ![d4381a52.png](:storage/942b05ef-d361-4d6a-9c51-0668c54e8931/d4381a52.png)
 
 
### Writing the Pod
  
`Reference API - <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/>`
  
  
  ```
  piVersion: v1
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
![6bb540b7.png](:storage/942b05ef-d361-4d6a-9c51-0668c54e8931/6bb540b7.png)
