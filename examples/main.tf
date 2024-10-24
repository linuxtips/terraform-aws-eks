module "EKS" {
  source = "../"

  team         = "platform"
  project      = "containers"
  cluster_name = "production"
  name         = "giropops"
}