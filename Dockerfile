FROM microsoft/dotnet:2.2-sdk-alpine AS build

WORKDIR /src
COPY alpine-protoc.csproj .
RUN dotnet restore alpine-protoc.csproj

RUN apk update \
    && apk --no-cache add libc6-compat \
    && apk --no-cache add protobuf \
    && cd /root/.nuget/packages/grpc.tools/1.19.0/tools/linux_x64 \
    && rm protoc \
    && ln -s /usr/bin/protoc protoc \
    && chmod +x grpc_csharp_plugin

COPY . .
RUN dotnet build alpine-protoc.csproj -c Release -o /app
