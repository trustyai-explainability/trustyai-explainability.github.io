# Disparate Impact Ratio

```shell
curl -X POST --location "http://{{host}}/metrics/dir" \
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

```http
HTTP/1.1 200 OK
content-length: 197
Content-Type: application/json;charset=UTF-8
{
  "type": "metric",
  "name": "DIR",
  "value": 0.3333333333333333,
  "specificDefinition":"The DIR of 0.33333 indicates that the likelihood of Group:gender=1 receiving Outcome:income=1 is 0.33333 times that of Group:gender=0."
  "id": "15f87802-30ae-424b-9937-1589489d6b4b",
  "timestamp": 1675850775317,
  "thresholds": {
    "lowerBound": 0.8,
    "upperBound": 1.2,
    "outsideBounds": true
  }
}
```
