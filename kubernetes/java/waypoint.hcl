project = "example-java"

app "example-java" {
  build {
    use "pack" {
      builder="gcr.io/buildpacks/builder:v1"
    }
    registry {
      use "aws-ecr" {
        region = "us-east-1"
        tag = "latest"
      }
    }  
  }

  deploy {
    use "kubernetes" {
      namespace = "default"
      probe_path = "/"
      service_port = 8080
    }
  }

  release {
    use "kubernetes" {
      node_port = 32000
    }
  }
}
