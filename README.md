# Red Hat Developer Hub Demo Installation Guide

## Overview

This document provides a comprehensive guide for installing the Red Hat Developer Hub demo, including all necessary components such as GitLab, Keycloak, and the use of OpenShift GitOps with ArgoCD. OpenShift Pipelines will also be utilized for CI/CD processes.

## Prerequisites

- OpenShift cluster
- Access to OpenShift CLI (`oc`)
- GitOps operator installed
- OpenShift Pipelines installed

## Installation Steps

### 1. Configure OpenShift GitOps with ArgoCD

1. Install the OpenShift GitOps operator from the Operator Hub.
2. Create an ArgoCD instance in your OpenShift cluster.
3. Connect ArgoCD to your Git repository containing the application manifests.


### 2. Set Up OpenShift Pipelines

1. Install the OpenShift Pipelines operator from the Operator Hub.
2. Create a new pipeline for your application, defining the necessary tasks and triggers.
3. Integrate the pipeline with GitLab for CI/CD workflows.

### 3. Apply the ArgoCD application

1. Apply the ArgoCD application configuration:

Edit this file /argo-application/rhdh-demo-deploy-application.yaml and set up these properties
```markdown
....
  source:
    helm:
      parameters:
        - name: cluster.domain
          value: <here-goes-your-openshift-cluster-domain>
        - name: github.pat
          value: <here-goes-your-github-personal-access-token(PAT)>
        - name: gitlab.version
          value: <here-goes-your-gitlab-version>  
    path: demo-deploy

....
```

2. Apply the ArgoCD application configuration:

    ```bash
    oc apply -f /argo-application/rhdh-demo-deploy-application.yaml
    ```
    This command will deploy the application defined in the specified YAML file to your OpenShift cluster.




## Troubleshooting

During gitlab installation:

failed to get restmapping: no matches for kind "Issuer" in version "cert-manager.io/v1","errorVerbose":"failed to get restmapping: no matches for kind "Issuer" in version "cert-manager.io/v1"
failed to obtain current configuration: gitlab-system/gitlab-issuer

OpenShift Cert Manager is missing, please install it.

admission webhook "vgitlab.kb.io" denied the request: gitlab.apps.gitlab.com "gitlab" is invalid: spec.chart.version: Invalid value: "8.11.4": chart version 8.11.4 not supported; please use one of the following: 9.1.1, 9.0.3, 8.11.5

## Troubleshooting

During gitlab installation:

failed to get restmapping: no matches for kind \"Issuer\" in version \"cert-manager.io/v1\"","errorVerbose":"failed to get restmapping: no matches for kind \"Issuer\" in version \"cert-manager.io/v1\"\nfailed to obtain current configuration: gitlab-system/gitlab-issuer

OpenShift Cert Manager is missing, please install it.


admission webhook "vgitlab.kb.io" denied the request: gitlab.apps.gitlab.com "gitlab" is invalid: spec.chart.version: Invalid value: "8.11.4": chart version 8.11.4 not supported; please use one of the following: 9.1.1, 9.0.3, 8.11.5

