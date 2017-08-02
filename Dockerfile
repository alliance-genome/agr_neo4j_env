FROM neo4j:3.0

ENV DEBIAN_FRONTEND noninteractive

ADD neo4j-graphql-0.1-SNAPSHOT.jar plugins

RUN echo 'dbms.unmanaged_extension_classes=org.neo4j.graphql=/graphql' >> /var/lib/neo4j/conf/neo4j.conf
RUN echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j.conf
