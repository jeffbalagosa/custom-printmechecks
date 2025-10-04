![PMV](https://drx-danwins.us-east-1.linodeobjects.com/drx-danwins/pmc_51525a39.png)

# What is this?
Print Me Checks is an open source check printing tool that runs on the web.

# Goal
The purpose of this project is to provide a free, locally run alternative to check printing tools that exist on the internet. Some of these tools charge $1.25 or more to print a check and you must provide your banking details to a third party. This is silly! This project was literally completed in one day and gets the same job done.

I buy blank check stock from (insert store here) and then use this tool to print checks for all my businesses with
multiple bank accounts. Works like a charm!

## Screenshot
![PMV](https://drx-danwins.us-east-1.linodeobjects.com/drx-danwins/screencapture-printmechecks-tiiny-site-2024-07-04-07_13_31_(1)_e9e4be02.png)

Simple Vue App for printing checks on 8.5x11 paper.

## Features
* Printing from the Browser
* Fancy signature font (optional)
* Routing and Account number uses official E13B Font
* Run locally to avoid sharing your account number over the internet
* Automatically converts amount of money to english words


# Demo
If you don't want to run the project locally, you can try out the demo version for free. Hosting is not guaranteed to be
up and running in the future though, but I'll keep it up as long as I can.

[Demo](https://printmechecks.tiiny.site/)

## Requirements
***Must Have Node installed***

## Usage

Clone the repository

```sh
git clone https://github.com/sktzofrenic/printmechecks.git
```
Enter the project directory

```sh
cd printmechecks
```
Install JS dependencies

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

Then go to http://localhost:5173/ in your browser to start printing

## Run with Docker (Production / Auto-Restart)

If you prefer to run this like a service (and have it come back after a reboot), you can use the included Docker and Docker Compose setup. With Docker, you don't need Node installed on the host.

### Prerequisites

- Docker
- Docker Compose v2 (usually included with modern Docker installations)

### Quick start

The repo includes a `Dockerfile`, `nginx.conf`, and `docker-compose.yml` that build the app and serve it via Nginx.

```bash
# From the project root
docker compose up -d
```

Open the app in your browser:

- Local: http://localhost:8080
- LAN:   http://<this-machine-ip>:8080

The Compose file sets `restart: unless-stopped` so the container will auto-restart when Docker starts (e.g., after a reboot).

### Ensure Docker starts on boot (Linux)

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

### Change the port

If port 8080 is already in use, edit `docker-compose.yml` and change the `ports` mapping. For example, to use 9090:

```yaml
services:
	printmechecks:
		ports:
			- "9090:8080"
```

Then recreate the container:

```bash
docker compose up -d --force-recreate
```

### Rebuild after code changes

```bash
docker compose build --no-cache
docker compose up -d
```

### Logs and status

```bash
docker ps
docker logs -f printmechecks
```

### Stop and remove

```bash
docker compose down
```

### What the Docker setup does

- `Dockerfile`: builds the Vue app using Node (multi-stage), then serves the compiled static site with Nginx
- `nginx.conf`: adds SPA routing support (fallback to `index.html`)
- `docker-compose.yml`: runs the container on port 8080 with `restart: unless-stopped`
- `.dockerignore`: keeps the build context small
