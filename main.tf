
# This is telling terraform , hey we are using docker provide, and also , we are using docker / kreuzwerker plugin (provider) 
# the version is saying use version 3.x or more but not version 4 this is to  avoid version mismatch 
# when we ran docker init  , it ensures the correct provider is downloaded 
# in short; this block is telling terraform , go download the right plugin/driver for Docker, so we can build stuff


terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~>3.0"

    }
  }
}

# this block of code is giving terraform  to access local docker deamon (docker engine)
# provider "docker  configure how terraform connects to docker service. The host points to the local docker deamon sockets
# this allow terraform to control docker containers on yor local machine

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# this block of code is saying , before we can run webserver, we need to download the image first , so go download the image
# resource "docker_image" ensure the require docker image is available. terraformpulls the nginx image from docker hub
#keep_locally : akkows the image to be cleaned up during destruction, we can run terraform destroy , it save discspace.


resource "docker_image" "nginx" {
  name          = "nginx:latest"
  keep_locally  = false   
}

# This creates a running docker containers from the image defined above and also, name the container 
# It Maps container port to port 80 (nginx default port) to your computer local port 8080 
#( this would allow your to access your deployed service local vai localhost:8080)
#resource "docker_container" is saying run a live web server container from imaged pulled name the contain nginx container



resource "docker_container" "nginx" {
  name = "nginx_container"
  image = docker_image.nginx.image_id
  
ports {
  internal = 80
  external = 8080
}
}



# Final note , how this block of code work together: 
# terraform block --> tells terraform which providers to use | provider block --> connects terraform to local docker
# docker_image ---> pulls the image needed for container 
#docker_container ---> runs the actual server 

# all of these are declarative