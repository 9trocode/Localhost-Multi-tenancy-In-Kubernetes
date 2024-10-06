# ENVTEST_K8S_VERSION refers to the version of kubebuilder assets to be downloaded by envtest binary.
ENVTEST_K8S_VERSION = 1.31


# go-get-tool will 'go get' any package $2 and install it to $1.
PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: local-cluster
local-cluster: ## Setup a cluster using kind locally
	@'./init.sh && local_cluster'

.PHONY: e2e
e2e: ## Run Test
	@'./init.sh && e2e'
	
.PHONY: cleanup
cleanup: ## Call the cleanup function from init.sh
	@echo "Running cleanup..."
	'./init.sh && force_cleanup'