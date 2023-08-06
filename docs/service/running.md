# Running

## Locally


The TrustyAI service is at its core a Quarkus application, which can be run locally using:

```shell
$ mvn quarkus:dev
```

This will start the service on port `8080`, using a in-memory database.

### Demos

The TrustyAI service includes several demos.

- generating data into storage, which can be monitored by the service
- or, having a process simulating sending KServe gRPC data to a consumer endpoint

With either of these demos, the TrustyAI service will monitor the payloads and produce fairness metrics.

The first step to run the demos locally, is to build the TrustyAI service container image.
This can be done by running (on `$PROJECT/explainability-service`):

```shell
mvn clean install -Dquarkus.container-image.build=true
```

### Using data in storage only

To run this demo, first build the remaining images using:

```shell
$ cd demo
$ docker compose -f compose-generator-memory-single-model.yaml build
```

Finally, run the demo using:

```shell
$ docker compose -f compose-generator-memory-single-model.yaml up
```
