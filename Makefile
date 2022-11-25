.PHONY=install_kong,create_cluster,build_and_push,update_cluster,run

install_kong:
	./scripts/install_kong.sh

install_kong_plugins:
	./scripts/install_kong_plugins.sh

create_cluster:
	./scripts/create_cluster.sh

build_and_push:
	./scripts/build_and_push.sh
	
update_cluster:
	./scripts/update_cluster.sh

PORT?=8085

run:
	kubectl -n kong port-forward --address localhost svc/kong-proxy ${PORT}:80
