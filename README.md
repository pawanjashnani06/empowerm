# Banking API Proxy

> A first service for a Java backend. We will break it up in more granular microservices as we go.

## Architecture

Generally this service will be an API proxy to existing APIs of the bank. The APIs are described in [banking-api-mocks](https://github.com/greenbank60days/banking-api-mocks)

### Approach

We as a team have agreed on not implementing our APIs with the Microservices approach from the beginning, but keep everything refactorable towards Microservices with minimal efforts. This allows us to quickly iterate in the beginning of the project and optimize for stability and availabilty later.

## Development setup

### Tools
    1. git
    2. oracle jdk8
    3. maven (optional, see below)
     
### Build process

We use `maven` but we have `maven wrapper` in project so instead of:

```
$ mvn clean install
```

we can run:

```
$ ./mvnw clean install
```

or (in case of Windows users)

```
$ ./mvnw.cmd clean install
``` 
   
Of course if You have your own `maven` installed You can use it but check if your version is synced with one specified by `.mvn/wrapper/maven-wrapper.properties`.

## Usage

To use this service as docker image build this project with:

```
$ ./mvn package
```

and run it with:

```
$ docker-compose up
```
