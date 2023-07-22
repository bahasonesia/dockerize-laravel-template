Copy or repository clone your laravel source code to src directory

To start the app for the first time, run this command to build Docker image
```
docker compose up -d --build
```

After that, you can start without `--build` argument
```
docker compose up -d
```

To run command inside container/service
```
docker compose run app <command>
```

For example, we want to install composer dependencies, we can run
```
docker compose run app composer install
```

To check container log
```
docker compose logs
```

OR if you want to check specific service logs,
```
docker compose logs <service_name>
docker compose logs nginx
docker compose logs database
```

you also can run npm commands for example
```
docker compose run npm install
```

To stop container from running
```
docker compose down
```

By default, app will be forwarded in port 80
If you're running multiple container or port 80 is used, change them to any other port in container NGINX