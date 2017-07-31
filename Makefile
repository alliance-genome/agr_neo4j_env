all:
	docker build -t agrdocker/agr_neo4j_env:develop .

push:
	docker push agrdocker/agr_neo4j_env:develop

pull:
	docker pull agrdocker/neo4j

bash:
	docker run -t -i agrdocker/neo4j bash
