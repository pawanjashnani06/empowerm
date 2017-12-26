
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
