all:
	docker build -t agrdocker/neo4j:develop .

push:
	docker push agrdocker/neo4j:develop

pull:
	docker pull agrdocker/neo4j

bash:
	docker run -t -i agrdocker/neo4j bash
