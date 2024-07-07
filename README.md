# Docker Lune

Docker files for [Lune](https://github.com/lune-org/lune).

Available images:
- Debian
  - Default. Uses the `debian:stable-slim` base image.
- Distroless
  - Barebones image. Uses the `gcr.io/distroless/cc` base image. No shell, package manager, or other tools are included.
- Binary only
  - Contains only the Lune binary. Used for adding Lune to other images.

## Run Lune

Enter the Lune REPL:

```bash
docker run -it nicell/lune repl
```

Enter the container shell:

```bash
docker run -it nicell/lune sh
```

Run a `server.luau` file:

```bash
docker run --init -it -p 3000:3000 -v $PWD:/app nicell/lune run app/server
```

The `--init` flag is required to properly handle signals such as `SIGINT` from `CTRL+C`. `-p 3000:3000` maps the container port 3000 to the host port 3000. `-v $PWD:/app` mounts the current directory to the `/app` directory in the container.

## Dockerfile Usage

```Dockerfile
FROM nicell/lune

# Port your app listens on
EXPOSE 3000

WORKDIR /app

COPY . .

# Run server.luau
CMD ["run", "server"]
```

## Custom Base Image

You can use the `nicell/lune:bin` image to add Lune to any base image.

```Dockerfile
FROM ubuntu
COPY --from=nicell/lune:bin /lune /usr/local/bin/
```
