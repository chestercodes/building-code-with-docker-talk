ARG BASE_IMAGE=mcr.microsoft.com/dotnet/sdk:6.0
FROM ${BASE_IMAGE} as build

ARG THE_ARG_VAR="default-arg-value"
ENV THE_ENV_VAR="default-env-value"

RUN echo "ARG value is $THE_ARG_VAR, ENV value is $THE_ENV_VAR"

WORKDIR /src/app2

COPY app2/app2.csproj .
RUN dotnet restore

WORKDIR /src/app2.Tests
COPY app2.Tests/app2.Tests.fsproj .
RUN dotnet restore

COPY app2/ /src/app2/

COPY app2.Tests /src/app2.Tests
RUN dotnet test


WORKDIR /src/app2
RUN dotnet publish -c Release -o /publish --no-restore

# start adding layers on a totally different base image
# all config set above is ignored
FROM mcr.microsoft.com/dotnet/runtime:6.0 as runtime

# set user to run as, ideally won't be root
USER root

# metadata about image, can be used to find containers/images
LABEL "com.example.vendor"="ACME Incorporated"
LABEL version="1.0"

# information(!) about ports that image exposes
EXPOSE 80
EXPOSE 443

WORKDIR /app

# destination needs to be a dir that the user can access
COPY --from=build /publish .

# entrypoint forces startup command to start with "dotnet app2.dll"
ENTRYPOINT [ "dotnet", "app2.dll" ]
CMD [ "extra-arg-1", "extra-arg-2" ]
# in this case CMD adds overridable default args that are 
# added after the entrypoint i.e.
#   dotnet app2.dll extra-arg-1 extra-arg-2