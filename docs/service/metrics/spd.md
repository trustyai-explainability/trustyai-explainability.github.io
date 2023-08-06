# Statistical Parity Difference

Get statistical parity difference at `/metrics/spd`

```shell
curl -X POST --location "http://{{host}}/metrics/spd" \
    -H "Content-Type: application/json" \
    -d "{
          \"modelId\": \"example-model-1\",
          \"protectedAttribute\": \"input-2\",
          \"favorableOutcome\": 1.0,
          \"outcomeName\": \"output-0\",
          \"privilegedAttribute\": 1.0,
          \"unprivilegedAttribute\": 0.0
        }"
```

Returns:

```http
HTTP/1.1 200 OK
content-length: 199
Content-Type: application/json;charset=UTF-8

{
  "type": "metric",
  "name": "SPD",
  "value": -0.2531969309462916,
  "specificDefinition":"The SPD of -0.253196 indicates that the likelihood of Group:gender=1 receiving Outcome:income=1 was -25.3196 percentage points lower than that of Group:gender=0."
  "timestamp": 1675850601910,
  "thresholds": {
    "lowerBound": -0.1,
    "upperBound": 0.1,
    "outsideBounds": true
  },
  "id": "ec435fc6-d037-493b-9efc-4931138d7656"
}
```
