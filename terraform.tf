terraform {

  cloud {
    organization = "deriv-test-org"

    workspaces {
      name = "tfcloud-tf"
    }
  }
}
