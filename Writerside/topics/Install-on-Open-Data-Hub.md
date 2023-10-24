# Installing on Open Data Hub

This guide will walk through installing Open Data Hub and TrustyAI into your cluster. Starting from a completely
blank cluster, you will be left with:

1) An Open Data Hub installation
2) A namespace to deploy models into
3) A [TrustyAI Operator](TrustyAI-operator.md), to manage all instances of the [TrustyAI Service](TrustyAI-service.md)
4) A TrustyAI Service, to monitor and analyze all the models deployed into your model namespace.

<deflist style="narrow" sorted="desc">
    <def title="$ODH">
        Namespace to install ODH into
    </def>
    <def title="$PROJECT">
        Namespace to deploy models into
    </def>
</deflist>

<procedure title="Cluster setup" id="cluster-setup">
    <step>
        <p>Make sure you are <code>oc login</code>'d to your OpenShift cluster</p>
    </step>
    <step>
        <p>Create two projects, <code>$ODH</code> and <code>$PROJECT</code>.<p>
         <p>These names are arbitrary, but I'll be using them throughout the rest of this demo</p>
         <code-block lang="shell">
            oc create project $ODH
            oc create project $PROJECT
         </code-block>    
   </step>
<step>
<p>Prepare the <code>$PROJECT</code> for ODH's model serving </p>
<code-block lang="shell">
   oc label namespace $PROJECT "modelmesh-enabled=true" --overwrite=true
</code-block>
</step>
</procedure>

To get enable ODH's monitoring stack, user-workload-monitoring must be configured.

<procedure title="Enable User-Workload-Monitoring" id="enable-user-workload-monitoring">
<step>
<p>Enable user-workload-monitoring</p>
<code-block>
oc apply -f resources/enable_uwm.yaml
</code-block>
</step>
<step>
<p>Configure user-workload-monitoring to hold metric data for 15 days</p>
<code-block>
oc apply -f resources/uwm_configmap.yaml
</code-block>
</step>
</procedure>

Depending on how your cluster was created, you may need to enable a User Workload Monitoring setting from
your cluster management UI (for example, on console.redhat.com)

<procedure title="Install ODH Operator" id="install-odh-operator">
<step>
<p>From the OpenShift Console, navigate to "Operators" -> "OperatorHub", and search for "Open Data Hub"</p>
<img src="odh_operator_install.png" alt="ODH in OperatorHub" border-effect="line"/>
</step>
<step>
<p>Click on "Open Data Hub Operator"</p>
<list>
<li>If the "Show community Operator" warning opens, hit "Continue"</li>
<li>Hit "Install"</li>
</list>
</step>
<step>
   <p>From the "Install Operator" screen</p>
    <list>
        <li>Make sure "All namespaces on the cluster" in selected as the "Installation Mode"</li>
        <li>Hit install</li>
</list>
</step>
<step>
<p>Wait for the Operator to finish installing</p>
</step>
</procedure>

## ODH v1

<note>
<p>If the provided ODH version in your cluster's OperatorHub is version 1.x, use the following steps</p>
</note>

<procedure title="Install ODH v1" id="install-odh-v1">
<step>
<p>Navigate to your <code>$ODH</code> project</p>
</step>
<step>
<p>From "Installed Operators", select "Open Data Hub Operator"</p>
</step>
<step>
<p>Navigate to the "Kf Def" tab</p>
<list>
<li>Hit "Create KfDef"</li>
<li>Hit "Create" without making any changes to the default configuration</li>
</list>
</step>
<step>
<p>Within the "Pods" menu, you should begin to see various ODH components being created</p>
</step>
</procedure>

<procedure title="Install TrustyAI on ODH v1" id="install-trustyai-on-odh-v1">
<step>
<p>Navigate to your <code>$ODH</code> project</p>
<code-block lang="shell">oc project $ODH</code-block>
</step>
<step>
<p>Run <code>oc apply -f resources/trustyai_operator_kfdef.yaml</code>. This will install the TrustyAI Operator
   into your <code>$ODH</code> namespace alongside the ODH installation.</p>
</step>
<step>
<p>Within the "Pods" menu, you should see the TrustyAI Operator pod being created</p></step>
<step>
<p>Navigate to your <code>$PROJECT</code> project</p>
<code-block lang="shell">oc project $PROJECT</code-block>
</step>
<step>
<p>Run <code>oc apply -f resources/trustyai_crd.yaml</code>. This will install the TrustyAI Service
   into your <code>$PROJECT</code> project, which will then provide TrustyAI features to all subsequent models deployed into
   that project, such as explainability, fairness monitoring, and data drift monitoring</p>
</step>
</procedure>

## ODH v2.x

If the provided ODH version in your cluster's OperatorHub is version 2.x, use the following steps:

(todo)
