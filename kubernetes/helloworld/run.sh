#!/bin/bash
systemctl disable firewalld 
systemctl stop firewalld
systemctl start etcd
systemctl start docker
systemctl start kube-apiserver
systemctl start kube-controller-manager
systemctl start kube-scheduler
systemctl start kubelet
systemctl start kube-proxy
systemctl start docker-distribution
echo "success"
