all:
	docker build -t agrdocker/agr_neo4j_env .

push:
	docker push agrdocker/agr_neo4j_env

pull:
	docker pull agrdocker/agr_neo4j_env

bash:
	docker run -t -i agrdocker/agr_neo4j_env bash

run:
	docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=none --env NEO4J_dbms_memory_heap_maxSize=8g --env NEO4J_dbms_connectors_default__listen__address=0.0.0.0 agrdocker/agr_neo4j_env

docker-data-pull:
	docker pull agrdocker/agr_neo4j_qc_data_image

docker-data-run:
	docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=none -e NEO4J_dbms_memory_heap_maxSize=8g agrdocker/agr_neo4j_qc_data_image
