FROM neo4j:3.0

ENV DEBIAN_FRONTEND noninteractive

ADD neo4j-graphql-0.1-SNAPSHOT.jar plugins
