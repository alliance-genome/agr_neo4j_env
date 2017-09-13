FROM neo4j:3.2-enterprise

ADD neo4j-graphql-0.1-SNAPSHOT.jar plugins
ADD apoc-3.2.0.4-all.jar plugins

RUN echo 'dbms.unmanaged_extension_classes=org.neo4j.graphql=/graphql' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j.conf

RUN rm data
RUN mkdir data
RUN chown 112.nogroup data
