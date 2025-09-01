HOST_OS ?= kindest/node:v1.34.0
ARCH ?= $(shell arch)

.PHONY: pull-host-image kind-build create-cluster delete-cluster kind-up kind-down clear

pull-host-image:
    docker pull --platform $(ARCH) $(HOST_OS)

kind-build: pull-host-image
	docker compose build --build-arg PLATFORM=$(ARCH) kind

.kube:
	mkdir -p $@

kind-up: kind-build .kube
	docker compose up -d kind

create-cluster: kind-up
	docker compose exec kind kind create cluster --config /kind-config.yaml --name test-cluster
	@echo "Set KUBECONFIG"
	@echo "export KUBECONFIG=${PWD}/.kube/config"

delete-cluster: kind-up
	docker compose exec kind kind delete cluster --name test-cluster
	@echo "Cluster deleted"

kind-down: kind-up
	docker compose down

clear:
	rm -rf .kube