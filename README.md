# .Net Core Sonar Scanner on Docker Container

Sonar Scanner MsBuild Dockerfile for .Net Core Projects

[![Docker Pulls](https://img.shields.io/docker/pulls/burakince/docker-dotnet-sonarscanner.svg)](https://hub.docker.com/r/burakince/docker-dotnet-sonarscanner/) [![Docker Automated build](https://img.shields.io/docker/automated/burakince/docker-dotnet-sonarscanner.svg)](https://hub.docker.com/r/burakince/docker-dotnet-sonarscanner/) [![Docker Build Status](https://img.shields.io/docker/build/burakince/docker-dotnet-sonarscanner.svg)](https://hub.docker.com/r/burakince/docker-dotnet-sonarscanner/)

## This Image Using

|                | Name          | Version       |
| -------------- |:-------------:| -------------:|
| OS             | Debian        |   Stretch (9) |
| Java           | OpenJDK       |  8 Update 171 |
| .NET Framework | Mono          |    5.12.0.226 |
| .NET SDK       | .NET Core SDK | 2.1 (2.1.300) |
| Sonar Scanner  | CLI           |    3.1.0.1141 |
| Sonar Scanner  | MS Build      |    4.2.0.1214 |

Please check [Releases Page](https://github.com/burakince/docker-dotnet-sonarscanner/releases) for details.

## Latest Versions

[Latest Debian](https://www.debian.org/releases/stable/)
[Latest OpenJDK](https://hub.docker.com/r/library/openjdk/tags/)
[Latest Mono](https://www.mono-project.com/download/stable/#download-lin-debian)
[Latest .Net SDK](https://www.microsoft.com/net/download/all)
[Latest Sonar Scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild)

## Using Example

First of all you need a sonarqube server. If you haven't one, run this code;

```
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
```

And then you need .Net Core project. If you haven't one, run this codes;

```
mkdir ConsoleApplication1
cd ConsoleApplication1

dotnet new console
dotnet new sln
dotnet sln ConsoleApplication1.sln add ConsoleApplication1.csproj
```

Take login token from sonarqube server, change working directory to project directory and run this code;

```
docker run --name dotnet-scanner -it --rm -v $(pwd):/project \
  -e PROJECT_KEY=ConsoleApplication1 \
  -e PROJECT_NAME=ConsoleApplication1 \
  -e PROJECT_VERSION=1.0 \
  -e HOST=http://localhost:9000 \
  -e LOGIN_KEY=CHANGE_THIS_ONE \
  burakince/docker-dotnet-sonarscanner
```

Note: If you have sonarqube as docker container, you must inspect sonarqube's bridge network IP address and use it in HOST variable.

```
docker network inspect bridge
```
