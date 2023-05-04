ARG BASE_IMAGE=mcr.microsoft.com/dotnet/sdk:6.0
FROM ${BASE_IMAGE}

# ARG can be passed into build stage as a cli argument, useful for secrets etc
ARG THE_ARG_VAR="default-arg-value"
# ENV sets default environment vars for build and run time
ENV THE_ENV_VAR="default-env-value"

RUN echo "ARG value is $THE_ARG_VAR, ENV value is $THE_ENV_VAR"

# working directory for all RUN and COPY commands
WORKDIR /src/app2

# copy proj files and restore packages for projects
COPY app2/app2.csproj .
RUN dotnet restore

WORKDIR /src/app2.Tests
COPY app2.Tests/app2.Tests.fsproj .
RUN dotnet restore

# copy project files to dir
COPY app2/ /src/app2/

# copy the rest of the tests files and run tests
COPY app2.Tests /src/app2.Tests
RUN dotnet test

WORKDIR /src/app2

RUN dotnet publish -c Release -o /publish --no-restore

WORKDIR /publish

CMD [ "dotnet", "app2.dll" ]