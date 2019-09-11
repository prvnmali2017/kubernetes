
## Questions for CKA

### Question 1 - Label Selectors

Deploy two pods:

One pod with a label of “Tier = Web”
One pod with a label of “Tier = App”

Use any container image you see fit.
Verify the labels are applied.

### Question 2 - Daemonsets

Deploy a Daemonset that leverages the nginx image

Verify the daemonset has been created successfully

### Question 3 - Resource Limits

Create a new namespace called “Tenant-B-100Mi”

Create a memory limit of 100Mi for this namespace

Create a pod with a memory request of 150Mi, ensure the limit has been set by verifying you get a error message.

### Question 4 - Multiple Schedulers

Assume another scheduler “CustomScheduler” has been created in your environment. Configure a pod to use this scheduler.

Validate the pod is using this scheduler.

### Question 5 - Schedule Pod without a scheduler

On one of the worker nodes:

Create a the directory /etc/staticpods

Create a pod manifest file in this directory

Configure the kubelet service on this worker node to create pods from /etc/staticpods

### Question 6 - Display Scheduler Events

Create a pod manifest file using the nginx image which will create a pod called “nginx-web” (Alternatively do this via kubectl run)

Extract the events from the cluster, particularly those pertaining to scheduling to find where this pod was scheduled to.

Extract the logs from the pod running the default scheduler, or from the respective file if running as a deamon service on your master node.

### Question 7 - Know how to configure the Kubernetes Scheduler

Configure the Kube-Scheduler by adding --logtostderr=true to the existing configuration.

### Question 8 - General cluster status

Leveraging a single kubectl command acquire the current status for the Scheduler, Controller-Manager and etcd components

### Question 9 - Acquiring component logs

List the logs from the following components on a master node:

Kube-APIServer
Kube-Scheduler
Kube-Controller-Manager
List the logs from the following components on a worker node:

CNI
Kube-Proxy
Kubelet
Container Runtime

### Question 10 - Perform rolling updates on a deployment

Update this deployment to leverage the nginx container version 1.7.11. Ensure that --record=true has been used.

### Question 11 - Change the update strategy for a deployment

Strategy is “Rolling Update”
Max Surge is “1”
Max Unavailable is “1”

### Question 12 - Scale a deployment

Scale the deployment from the first lab exercise to leverage 6 pods.

### Question 13 - Create and run a Job

Spec and execute a job that:
Leverages the “perl” image
Calculates pi to 2000 places
Note, use the command command: ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"] in the pod manifest
The command above will output to stdout on the container, therefore inspect the output

### Question 14 - Create and use a Config Map

Create two texts files in /tmp/

db_h.txt with the contents “database_host”
db_p.txt with the contents “database_port”

Create a configmap called “db-connection” from the above two files.
Create a nginxpod which leverages these values as environment variables “db_h” and “db_p”

### Question 15 - Create and use Secrets

Create a secret called “db-credentials” directly from the CLI with the following key:value pair.
db-username : dbuser
db-password : dbpassword

Create a pod to leverage these as environment variables.

### Question  16 - Configure a pod with specific environment variables

Create a pod that has two environment variables configured:
Variable1 = somevalue
Variable2 = someothervalue

### Question  17 - Cluster Upgrades

Upgrade a Kubernetes cluster running a previous version to the latest version

Upgrade the kubeadm binary
Assess the upgrade path that kubeadm has provided
Note down the command to execute the upgrade
Upgrade Kubelet on all the nodes

### Question  18 - Cluster Upgrades - OS Upgrades

Gracefully remove a node from active service
Verify the node has scheduling disabled
Gracefully return a node into active service
Verify the node has scheduling enabled

### Question  19- Back up etcd

Take a snapshot of the etcd database
Verify the snapshot

### Question  20 - RBAC Question
### Question  21 - Storage Question


I will add more questions.
