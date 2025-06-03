# Nginx Web Server Deployment with Terraform and Docker

This project uses **Terraform** to provision an **Nginx web server** container on your **local Docker daemon**. 
It's a simple, beginner-friendly example of Infrastructure as Code (IaC), ideal for learning or testing purposes.

---

## What’s Included

- Terraform configuration using the [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest) provider
- Local deployment of `nginx:latest` image
- Port mapping: access the container via `http://localhost:8080`
- Clean, modular `.tf` files (variables, outputs, main config)

---

## Prerequisites

Before running this project, make sure you have the following installed:

- [Terraform](https://www.terraform.io/downloads)
- [Docker](https://docs.docker.com/get-docker/)
- A running **Docker daemon** (e.g., `Docker Desktop` or `dockerd` on Linux)

---

## How to Use

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/terraform-nginx-docker.git
   cd terraform-nginx-docker



### Once the deployment is complete, open your browser and go to http://localhost:8080 to view the default Nginx welcome page served by the Docker container.

![image](https://github.com/user-attachments/assets/18af5f24-aec7-48c3-999c-7a307bef18f6)
