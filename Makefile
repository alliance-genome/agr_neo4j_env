REG := 100225593120.dkr.ecr.us-east-1.amazonaws.com
VERSION := 5.5.0-enterprise

registry-docker-login:
ifneq ($(shell echo ${REG} | egrep "ecr\..+\.amazonaws\.com"),)
	@$(eval DOCKER_LOGIN_CMD=docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli)
ifneq (${AWS_PROFILE},)
	@$(eval DOCKER_LOGIN_CMD=${DOCKER_LOGIN_CMD} --profile ${AWS_PROFILE})
endif
	@$(eval DOCKER_LOGIN_CMD=${DOCKER_LOGIN_CMD} ecr get-login-password | docker login -u AWS --password-stdin https://${REG})
	${DOCKER_LOGIN_CMD}
endif

all:
	docker build -t ${REG}/agr_neo4j_env:${VERSION} .

push: registry-docker-login
	docker push ${REG}/agr_neo4j_env:${VERSION}

pull: registry-docker-login
	docker pull ${REG}/agr_neo4j_env:${VERSION}

bash:
	docker run -t -i ${REG}/agr_neo4j_env:${VERSION} bash

run:
	docker run -p 7474:7474 -p 7687:7687 ${REG}/agr_neo4j_env:${VERSION}

eb-init:
	eb init --region us-east-1 -p Docker neo4j-server

eb-create:
	@eb create neo4j-stage --region=us-east-1 --cname="neo4j-stage" --elb-type application
