# dotnet-sonar-scanner

Sonar Scanner MsBuild Dockerfile for .Net Core Projects

## Run

```
docker run -t -i -v $(pwd):/project \
  -e PROJECT_KEY=ConsoleApplication1 \
  -e PROJECT_NAME=ConsoleApplication1 \
  -e PROJECT_VERSION=1.0 \
  -e HOST=http://localhost:9000 \
  -e LOGIN_KEY=d2133ae83b2dc2fe5e04fe3cd3a204d2cee081d1 \
  burakince/docker-dotnet-sonar-scanner
```
