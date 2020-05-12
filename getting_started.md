# Getting Started

## Connecting to a PKS cluster

### login to pks
```
pks login -a <your-pks-api> -u kuber<number> -p <password> -k
```

### list clusters

```
pks clusters
```

### view cluster details

```
pks cluster <cluster-name>
```

### connect to the workshop cluster

```
pks get-kubeconfig -a <your-pks-api> -u kuber<number> -p <password> -k <cluster-name>
```

### verify connection to the k8s cluster

```
kubectl get namespaces
```

### set your namespace as the default namespace

```
kubectl config set-context --current --namespace=kuber<number>
```

