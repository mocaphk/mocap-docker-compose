# mocap-docker-compose

A docker compose file that launch all the containers needed for mocap to work.

## How to start

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

4. In `mocap-docker-compose`, build the docker image.

    ```bash
    docker-compose build
    ```

5. Create a docker network `mocap` if you haven't already.

    ```bash
    docker network create mocap
    ```

6. Create a copy of `.env.production` and rename it as `.env.production.local`.

7. Fill in all required environment variables.

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
