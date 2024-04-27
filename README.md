# mocap-docker-compose

## What is MOCAP

![MOCAP demo](./.github/assets/demo.gif)

Multipurpose Online Coding Assessment Platform (MOCAP) is a web-based platform that aims to eliminate the need for students to individually configure their coding environments when completing course coding assignments.

To complete course coding assignments, students need to set up a coding environment on their local machines. However, issues might arise when setting up the environment due to discrepancies in libraries, dependencies, operating systems, and hardware. These differences can lead to problems when running assignments in markers' environments, resulting in disputes between students and teachers.

To address this problem, MOCAP provides a solution by hosting a web platform that offers a customizable coding environment using Docker. Docker ensures environment consistency and replicability, thereby eliminating the problems arising from discrepancies in libraries, dependencies, and operating systems.

## What is mocap-docker-compose

mocap-docker-compose is a docker compose repository for creating frontend, backend, Keycloak, database, and NGINX for MOCAP.

## Getting Started

1. Clone all the repositories. Your folder structure should be like this.

    ```bash
    ./
    ├── mocap-frontend/
    │   ├── ...
    │   └── compose.yaml
    ├── mocap-backend/
    │   ├── ...
    │   └── compose.yaml
    ├── mocap-keycloak/
    │   ├── ...
    │   └── compose.yaml
    └── mocap-docker-compose
    ```

2. Fill in all the `.env.production.local` in all the repositories respectively.

3. Make sure all the repositories are up to date by running:

    ```bash
    chmod +x git-pull.sh
    ./git-pull.sh
    ```

4. In `mocap-docker-compose`, create a copy of `.env.production` and rename it as `.env.production.local`.

5. Fill in all required environment variables.

6. Build the docker image.

    ```bash
    docker-compose build
    ```

7. Create a docker network `mocap` if you haven't already.

    ```bash
    docker network create mocap
    ```

8. Start the container.

    ```bash
    docker-compose up
    ```

## Setting up HTTPS

Let’s Encrypt is used for HTTPS connection.

1. Install certbot

    ```bash
    sudo apt install certbot
    ```

2. Obtain the TLS/SSL certificate from the Let’s Encrypt

    ```bash
    sudo certbot certonly -d <domain1> -d <domain2>
    ```

3. Copy The TSL/SSL Certificates

    ```bash
    sudo mkdir -p /etc/letsencrypt/ssl
    sudo cp -r -L /etc/letsencrypt/live/<domain>/fullchain.pem /etc/letsencrypt/ssl/
    sudo cp -r -L /etc/letsencrypt/live/<domain>/privkey.pem /etc/letsencrypt/ssl/
    ```

## How to backup database

### Backup

    ```bash
    docker exec -t mocap-database pg_dump mocap -U admin > dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql
    ```

and then sftp to download it.

### Restore

    ```bash
    cat <backup_file> | docker exec -i mocap-database psql mocap -U admin
    ```

## Contributing

-   Please fork this repository and create a pull request if you want to contribute.

-   Please follow [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) when you commit!
