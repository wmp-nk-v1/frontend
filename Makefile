docker-build:
	git pull
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 293222827824.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 293222827824.dkr.ecr.us-east-1.amazonaws.com/frontend:latest .
	docker push 293222827824.dkr.ecr.us-east-1.amazonaws.com/frontend:latest

eks-deploy:
	env
	aws eks update-kubeconfig --name dev
	helm upgrade -i frontend-service helm -f helm/values/frontend-service.yml