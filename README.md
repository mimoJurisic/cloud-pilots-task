# cloud-pilots-task
Steps followed:
1) create github repo
2) clone repo
3) create tf files
4) k8s deployment files
5) create service account in GCP
6) create github secrets with SA key
7) create github actuib workflow
8) push code
# 3) tf files
- create VPC + subnets (vpc.tf)
- create GKE cluster (gke.tf)
- create k8s deployments (k8s.tf)
- create variables (variables.tf)
- create output (outputs.tf)
# 4) k8s deployment files
- create deployment
- create service (deafult=CLusterIp)
- create ingress
- create namespace
- create managed certificate(https)

# Additional
I added an A-Record in my AWS account -> route 53 Service -> demo.forest-coder.com
