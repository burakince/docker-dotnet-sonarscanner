#!/bin/bash

set -x

PROJECT_KEY="${PROJECT_KEY:-ConsoleApplication1}"
PROJECT_NAME="${PROJECT_NAME:-ConsoleApplication1}"
PROJECT_VERSION="${PROJECT_VERSION:-1.0}"
PROJECT_FILE="${PROJECT_FILE:-}"
SONAR_HOST="${HOST:-http://localhost:9000}"
SONAR_LOGIN_KEY="${LOGIN_KEY:-admin}"

mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe begin /d:sonar.host.url=$SONAR_HOST /d:sonar.login=$SONAR_LOGIN_KEY /k:$PROJECT_KEY /n:"$PROJECT_NAME" /v:$PROJECT_VERSION

if [ "$PROJECT_FILE" == "" ]; then
	dotnet restore
	dotnet build
	dotnet test
else
	dotnet restore $PROJECT_FILE
	dotnet build $PROJECT_FILE
	dotnet test $PROJECT_FILE	
fi

mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe end /d:sonar.login=$SONAR_LOGIN_KEY