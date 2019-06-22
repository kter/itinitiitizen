terraform {
  backend "gcs" {
    bucket  = "tfstate.kter.jp"
    prefix  = "terraform.tfstate"
  }
}
