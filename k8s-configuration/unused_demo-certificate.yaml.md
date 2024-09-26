# https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs
# can be attached to ingress !!
apiVersion: networking.gke.io/v1
kind: ManagedCertificate
metadata:
  name: demo-certificate
  namespace: acme
spec:
  domains:
    - demo.forest-coder.com
