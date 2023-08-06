# TSSaliency

TSSaliency is a time-series explainer for black-box forecaster models.

The endpoint is `/explainers/local/tssaliency`.

The payload follows the time-series general schema with the following parameters:

```json
{
  "model": {
    "target": "0.0.0.0:8081", // (1)!
    "name": "tsforda",
    "version": "v0.1.0"
  },
  "data": {
    "x": [23.45, 25.78, 24.32, 26.11, 25.92, 23.67, 24.53, 25.99, 26.24, 24.86]
  },
  "parameters": { // (2)!
    "mu": 0.01,
    "numberSamples": 50,
    "numberSteps": 10,
    "sigma": 10.0
  }
}
```

1.  This will consist of the address of the model. Typically `8081` is the gRPC port of the model, which is needed.
2.  All the parameters are optional. If not provided, a default values will be used.

The following values are mandatory:

- `target`: The address of the model. TrustyAI communicates with the model through gRPC, so the address should be in the form of `host:port` with port being typically `8081`.
- `name`: The name of the model. This is used to identify the model in TrustyAI.
- `version`: The version of the model. This is used to identify the model in TrustyAI.
- `data`: The time-series to be explained. Only numerical list supported at the moment. The data is structure as a list of features with each entry corresponding to a time-step.


All the parameters are optional. If not provided, a default values will be used.


The result will be a saliency map for the input time-series.
