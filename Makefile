start-application:
	./mvnw spring-boot:run

build-image:
	./mvnw spring-boot:build-image

generate-deployment:
	kubectl create deployment demo-config-server --image=demo-cloud-server:0.0.1-SNAPSHOT --dry-run=client -o yaml > k8s/deploy.yaml

generate-configmaps:
	kubectl create cm cm-apps --from-file=k8s/config --dry-run=client -o yaml > k8s/cm.yaml

deploy-cm:
	kubectl apply -n demo-config-ns -f k8s/cm.yaml

deploy-deployment:
	kubectl apply -n demo-config-ns -f k8s/deploy.yaml

check-deployment:
	kubectl get deploy -n demo-config-ns

delete-deployment:
	kubectl delete -n demo-config-ns -f k8s/deploy.yaml

generate-service:
	kubectl expose deployment demo-config-server -n demo-config-ns --port=8888 --target-port=8888 --dry-run=client -o yaml > k8s/service.yaml

deploy-service:
	kubectl apply -n demo-config-ns -f k8s/service.yaml

port-forward-service:
	kubectl -n demo-config-ns port-forward service/demo-config-server 8888:8888
