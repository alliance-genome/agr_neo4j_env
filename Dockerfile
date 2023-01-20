FROM neo4j:3.5.14-enterprise

#ADD neo4j-graphql-3.5.0.1.jar plugins
ADD apoc-3.5.0.1-all.jar plugins

#RUN echo 'dbms.unmanaged_extension_classes=org.neo4j.graphql=/graphql' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_state.memory_allocation=OFF_HEAP' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_state.max_off_heap_memory=0' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_log.rotation.retention_policy=false' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_log.preallocate=false' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.import.csv.buffer_size=134217728' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.connector.bolt.thread_pool_min_size=20' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.connector.bolt.thread_pool_max_size=100' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.connector.bolt.thread_pool_keep_alive=10m' >> /var/lib/neo4j/conf/neo4j.conf
#RUN echo 'dbms.security.procedures.unrestricted=algo.*,apoc.*' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'cypher.min_replan_interval=120000ms' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'cypher.statistics_divergence_threshold=0.9' >> /var/lib/neo4j/conf/neo4j.conf
#RUN cat /docker-entrypoint.sh | grep -v dbms.memory.pagecache.size > /temp_file && mv /temp_file /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

ARG NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT ${NEO4J_ACCEPT_LICENSE_AGREEMENT}

ARG NEO4J_AUTH=none
ENV NEO4J_AUTH ${NEO4J_AUTH}

ARG NEO4J_dbms_connectors_default__listen__address=0.0.0.0
ENV NEO4J_dbms_connectors_default__listen__address ${NEO4J_dbms_connectors_default__listen__address}

RUN rm data
RUN mkdir -p data/databases/graph.db
RUN chown -R neo4j.neo4j data
