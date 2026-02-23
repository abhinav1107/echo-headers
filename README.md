# echo-headers Helm Chart Repository

This GitHub Pages site hosts the Helm chart repository for **echo-headers**.

It is published from the `gh-pages` branch of this repo and should contain:
- `index.yaml` (Helm repository index)
- packaged charts (`*.tgz`)

## Add the Helm repository
```bash
helm repo add echo-headers https://abhinav1107.github.io/echo-headers/
helm repo update
```

Verify the chart is visible:
```bash
helm search repo echo-headers
# or
helm search repo echo-headers/echo-headers
```

## Install the chart

Create a namespace (optional, recommended):
```bash
kubectl create namespace echo-headers --dry-run=client -o yaml | kubectl apply -f -
```

install:
```bash
helm upgrade --install echo-headers echo-headers/echo-headers --namespace echo-headers
```

Uninstall:
```bash
helm uninstall echo-headers --namespace echo-headers
```

## Using custom values
Export the default values:
```bash
helm show values echo-headers/echo-headers > values.yaml
```

Edit values.yaml, then install/upgrade with it:
```bash
helm upgrade --install echo-headers echo-headers/echo-headers --namespace echo-headers -f values.yaml
```
