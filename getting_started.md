# Getting Started

## Connecting to a PKS cluster

### connect to the workshop cluster

```
pks get-kubeconfig workshop -a <your-pks-api> -u kuber<number> -p <password> -k
```

### verify connection to the k8s cluster

```
kubectl get namespaces
```

### set your namespace as the default namespace

```
kubectl config set-context --current --namespace=kuber<number>
```

