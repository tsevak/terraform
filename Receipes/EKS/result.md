# After deployment of AWS EKS , let test it access and deploy a nginx pod
```
terraform output
cluster_endpoint = "https://90BASWDDDDDDDWWWWWWWWQQQQ.gr7.ap-southeast-2.eks.amazonaws.com"
cluster_name = "dev-cluster"
```
```
aws eks --region ap-southeast-2 update-kubeconfig --name $(terraform output -raw cluster_name)
```
```
k get nodes
NAME                                               STATUS   ROLES    AGE   VERSION
ip-192-168-3-128.ap-southeast-2.compute.internal   Ready    <none>   11m   v1.27.1-eks-2f008fe
```
```
k run nginx --image nginx
```
```
k get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          2m28s
```