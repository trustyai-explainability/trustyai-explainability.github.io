# TrustyAI operator

The TrustyAI Kubernetes Operator aims at simplifying the deployment and management of the 
[TrustyAI service](TrustyAI-service.md) on Kubernetes and OpenShift clusters by watching for custom resources of kind 
`TrustyAIService` in the `trustyai.opendatahub.io` API group and manages deployments, services, and optionally, routes 
and `ServiceMonitors` corresponding to these resources.

The operator ensures the service is properly configured, is discoverable by Prometheus for metrics scraping 
(on both Kubernetes and OpenShift), and is accessible via a Route on OpenShift.

## Prerequisites

- Kubernetes cluster v1.19+ or OpenShift cluster v4.6+
- `kubectl` v1.19+ or `oc` client v4.6+

<seealso style="links">
       <category ref="related">
           <a href="Install-on-Open-Data-Hub.md">Installing on Open Data Hub</a>
           <a href="Installing-on-Kubernetes.md">Installing on Kubernetes</a>
       </category>
       <category ref="repos">
           <a href="https://github.com/trustyai-explainability/trustyai-service-operator">TrustyAI operator</a>
       </category>
        
</seealso>