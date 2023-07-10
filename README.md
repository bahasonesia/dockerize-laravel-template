To start the app for the first time, run this command to build Docker image
```
docker compose up -d --build
```

After that, you can start without `--build` argument
```
docker compose up -d
```

To run command inside container
```
docker compose run app <command>
```

For example, we want to install composer dependencies, we can run
```
docker compose run app composer install
```

To stop container from running
```
docker compose down
```