# Configuration

## Data sources

### Metrics data

Storage backend adapters implement the `Storage` interface which has the responsibility
of reading the data from a specific storage type (flat file on PVC, S3, database, _etc_)
and return the inputs and outputs as `ByteBuffer`.
From there, the service converts the `ByteBuffer` into a TrustyAI `Dataframe` to be used
in the metrics calculations.

The type of datasource is passed with the environment variable `SERVICE_STORAGE_FORMAT`.

The supported data sources are:

| Type                                      | Storage property |
|-------------------------------------------|------------------|
| MinIO                                     | `MINIO`          |
| Kubernetes Persistent Volume Claims (PVC) | `PVC`            |
| Memory                                    | `MEMORY`         |

The data can be batched into the latest `n` observations by using the configuration key
`SERVICE_BATCH_SIZE=n`. This behaves like a `n`-size tail and its optional.
If not specified, the entire dataset is used.

## Caching

The configuration variables include:

| Environment variable    | Values         | Default | Purpose                                                                   |
|-------------------------|----------------|---------|---------------------------------------------------------------------------|
| `QUARKUS_CACHE_ENABLED` | `true`/`false` | `true`  | Enables data fetching and metric calculation caching. Enabled by default. | 


## Kubernetes and OpenShift Deployment

To deploy in Kubernetes or OpenShift, the connection information can be passed into the manifest using the `ConfigMap`.
For more information, see the [Kubernetes](Installing-on-Kubernetes.md) and [OpenShift](Install-on-Open-Data-Hub.md) installation guides.

<seealso style="links">
       <category ref="related">
           <a href="Install-on-Open-Data-Hub.md">Installing on Open Data Hub</a>
           <a href="Installing-on-Kubernetes.md">Installing on Kubernetes</a>
       </category>
</seealso>