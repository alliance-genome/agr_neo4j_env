all:
	docker build -t agrdocker/agr_neo4j_env:develop .

push:
	docker push agrdocker/agr_neo4j_env:develop

pull:
	docker pull agrdocker/agr_neo4j_env:develop

bash:
	docker run -t -i agrdocker/agr_neo4j_env:develop bash

run:
	docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=none --env NEO4J_dbms_memory_heap_maxSize=6g --env NEO4J_dbms_connectors_default__listen__address=0.0.0.0 agrdocker/agr_neo4j_env:develop

docker-data-pull:
	docker pull agrdocker/agr_neo4j_qc_data_image:develop

docker-data-run:
	docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=none -e NEO4J_dbms_memory_heap_maxSize=6g agrdocker/agr_neo4j_qc_data_image:develop
