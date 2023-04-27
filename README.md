# AGR Loader Environment Documentation

This repository does not follow the standard AGR branching strategy, but instead adopts a NEO4j release based branching as `neo-x.y`.
In doing so, it supports an automatic stable GoCD build from such NEO4j versioned branch(es) for use in the staging (and production) environments, while enabling testing of new NEO4j versions on the build environment (on other branches). Any updates within a neo4j release should be done on the matching `neo-x.y` branch, and then merged into master.

After a version has been created, the user should create a tagged docker container with the following command

```bash
make all VERSION=<version>
make push VERSION=<version>
```
This will make it so that there is a agr_neo4j_env container available via ECR (by default). If you would like to use this version feel free to specify the version in the agr_neo4j's Dockerfile. The agr_loader Dockerfile should specify a specific version when pushing code to develop. This way we will know exactly what is running in dev, staging and production environments.  

In order to make changes and test them you might want to create a "develop" container. To do this you can use commands available in the Makefile:

*These are commands done on the development machine. If you are developing locally feel free to use the commands but don't push to ECR

## Building develop container
```bash
make all
```
## Share by pushing to container registry
```bash
make push
```

## Using develop container from container registry
```bash
make pull
```

## Running Bash inside container
```bash
make bash
```

# Neo4j Configuration File
The default configuration file included in this repository is for references purposes and is not explicitly used in building the image.


