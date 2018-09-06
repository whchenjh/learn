#!/bin/bash
# 单机版快速安装 Kubernetes

# 关闭 CentOs 自带的防火墙服务
stop_firewall(){
	systemctl disable firewalld
	systemctl stop firewalld
}

# 安装 etcd 和 Kubernetes 软件（会自动安装 Docker 软件）
install_k8s(){
	yum install -y etcd kubernetes
}

# 按顺序启动所有的服务
start_service(){
	systemctl start etcd
	systemctl start docker
	systemctl start kube-apiserver
	systemctl start kube-controller-manager
	systemctl start kube-scheduler
	systemctl start kubelet
	systemctl start kube-proxy
}


main(){
	#stop_firewall
	#install_k8s
	start_service
}

main

