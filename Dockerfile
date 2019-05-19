FROM quay.io/coreos/etcd:latest

ENV ETCDCTL_API 3
WORKDIR /usr/local/bin
