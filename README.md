# epgrec-on-kubernetes

This program is a epgrec on kubernetes including MySQL. kubernetes Job will be used to record TV programs as a Kubernetes job on Kubernetes worker node which has a recording functionality.

## Usage

```
kubectl create -f manifests/deploy-mysql.yaml
kubectl create -f manifests/deploy-epgrec.yaml
kubectl create -f manifests/svc-epgrec.yaml
```

## Verification

```
kubectl create -f manifests/job-recpt1-test.yaml
```

```
kubectl create -f manifests/
```
