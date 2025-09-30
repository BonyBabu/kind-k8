# kind-k8

[kind](https://kind.sigs.k8s.io/) is a tool for running local Kubernetes clusters using Docker container “nodes”.
[kind](https://kind.sigs.k8s.io/) was primarily designed for testing Kubernetes itself, but may be used for local development or CI.


## How to create cluster

```bash
make create-cluster
```

## How to use cluster
```bash
export KUBECONFIG=${PWD}/.kube/config
```


## How to delete cluster

```bash
make delete-cluster
```

