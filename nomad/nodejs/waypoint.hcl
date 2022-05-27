project = "example-nodejs"

app "example-nodejs" {

  runner {
    enabled = true

    data_source "git" {
      url  = "https://github.com/hashicorp/waypoint-examples.git"
      path = "nomad/nodejs"
    }
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "localhost:5000/nodejs-example"
        tag   = "1"
        local = true
      }
    }
  }

  deploy {
    use "nomad" {
      // these options both default to the values shown, but are left here to
      // show they are configurable
      datacenter = "dc1"
      namespace  = "default"
    }
  }

}
