# [pgweb](https://github.com/sosedoff/pgweb) in docker [![Azure Build Status](https://okampfer.visualstudio.com/docker_pgweb_build/_apis/build/status/athrunsun.docker_pgweb?branchName=master)](https://okampfer.visualstudio.com/docker_pgweb_build/_build/latest?definitionId=4&branchName=master) [![Github Build Status](https://github.com/athrunsun/docker_pgweb/workflows/build_docker_image_and_push/badge.svg)](https://github.com/athrunsun/docker_pgweb/actions)
Before getting started, you'll need to have a running postgres database server.

## Usage
### Direct connection to a database server in a docker container
```shell
docker run --rm --name pgweb -p 8080:8080 --link <postgres_server_container:postgres> -e USER=<user> -e PASSWORD=<password> -e HOST=postgres -e PORT=<postgres_server_port> -e DATABASE=<postgres_database> okampfer/pgweb
```

### Direct connection to a non-docker database server
```shell
docker run --rm --name pgweb -p 8080:8080 -e USER=<user> -e PASSWORD=<password> -e HOST=<postgres_server_host> -e PORT=<postgres_server_port> -e DATABASE=<postgres_database> okampfer/pgweb
```

### Multiple database sessions mode (to connect to arbitary postgres servers)
```shell
docker run --rm --name pgweb -p 8080:8080 -e MULTIPLE_SESSIONS=1 okampfer/pgweb
```

### Available environment variables
- `BIND_ADDRESS`, custom binding address, defaults to `0.0.0.0`.
- `LISTEN_PORT`, custom listening port, defaults to `8080`.
- `USER`, database user.
- `PASSWORD`, database password.
- `HOST`, database host.
- `PORT`, database port.
- `DATABASE`, postgres database to connect to.
- `SSL_MODE`, ssl mode.
- `MULTIPLE_SESSIONS`, to enable multiple database sessions in pgweb, must be a non-empty value.
