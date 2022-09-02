FROM neo4j:4.4.9-enterprise

ADD apoc-4.4.0.8-all.jar plugins

# not used RUN echo 'dbms.unmanaged_extension_classes=org.neo4j.graphql=/graphql' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_state.memory_allocation=OFF_HEAP' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.tx_state.max_off_heap_memory=0' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.import.csv.buffer_size=134217728' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'dbms.connector.bolt.thread_pool_min_size=20' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'dbms.connector.bolt.thread_pool_max_size=100' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'dbms.connector.bolt.thread_pool_keep_alive=10m' >> /var/lib/neo4j/conf/neo4j.conf
# not used RUN echo 'dbms.security.procedures.unrestricted=algo.*,apoc.*' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'cypher.min_replan_interval=120000ms' >> /var/lib/neo4j/conf/neo4j.conf
# RUN echo 'cypher.statistics_divergence_threshold=0.9' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.memory.pagecache.size=24GB' >> /var/lib/neo4j/conf/neo4j.conf
# RUN cat /docker-entrypoint.sh | grep -v dbms.memory.pagecache.size > /temp_file && mv /temp_file /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# Metrics and Graphite settings
RUN echo 'metrics.csv.enabled=true' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.csv.interval=30s' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.csv.rotation.size=10M' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.csv.rotation.compression=zip' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.graphite.enabled=true' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.graphite.server=localhost:2003' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.graphite.interval=30s' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'metrics.prefix=Neo4j_1' >> /var/lib/neo4j/conf/neo4j.conf


ARG NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT ${NEO4J_ACCEPT_LICENSE_AGREEMENT}

ARG NEO4J_AUTH=none
ENV NEO4J_AUTH ${NEO4J_AUTH}

ARG NEO4J_dbms_connectors_default__listen__address=0.0.0.0
ENV NEO4J_dbms_connectors_default__listen__address ${NEO4J_dbms_connectors_default__listen__address}

RUN rm data
RUN mkdir -p data/databases/graph.db
RUN chown -R neo4j.neo4j data
