# AGR Loader Environment Documentation

This repo follows the HubFlow conventions for releasing the versions of the code as specified here: [HubFlow](https://datasift.github.io/gitflow/)

Versions of this repos do not need to be done at the same time as the agr_neo4j. When the developer is ready to make a verions of the code they should use the following command.

```bash
git hf init
git hf release start <version>
git hf release finish <version>
```

After a version has been created the user should create a tagged docker container with the following command

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



