# epgrec-on-kubernetes

This program is a epgrec on kubernetes including MySQL. kubernetes Job will be used to record TV programs as a Kubernetes job on Kubernetes worker node which has a recording functionality.

Epgrec official website:

http://www.mda.or.jp/epgrec/

## Docker Image

You can donwload a docker image from DockerHub.

https://hub.docker.com/repository/docker/a2ito/epgrec-frontend/

## Usage

### Deploy Epgrec and MySQL

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
