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

### Create Role and RoleBindings 

```
kubectl create -f manifests/role-epgrec-system.yaml
kubectl create -f manifests/rolebindings-epgrec-system.yaml
```

### Create X509 certificates for user 

```



openssl genrsa -out epgrec-system.pem 4096
openssl req -new -key epgrec-system.pem -out epgrec-system.csr -subj "/CN=epgrec-system/O=epgrec"
sudo openssl x509 -req -in epgrec-system.csr \
  -CA ca.crt \
  -CAkey ca-key.pem \
  -CAcreateserial -out epgrec-system.crt -days 365
```

### Create User

```
kubectl config set-cluster rasp-cluster \
  --server=https://192.168.11.105:6443 \
  --certificate-authority=...
kubectl config set-credential epgrec-system \
  --client-certificate=epgrec-system.pem \
  --client-key=epgrec-system-key.pem
kubectl config set-context epgrec-system \
  --user=epgrec-system \
  --cluster=rasp-cluster
```

```
kubectl config view --minify
kubectl config view --minify > epgrec-system.kubeconfig
```

## Verification

```
KUBECONFIG=./epgrec-system.kubeconfig kubectl create -f manifests/job-recpt1-test.yaml
```

```
kubectl create -f manifests/
```
