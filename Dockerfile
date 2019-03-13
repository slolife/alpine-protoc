FROM microsoft/dotnet:2.2-sdk-alpine AS build
#FROM microsoft/dotnet:2.2-sdk AS build

WORKDIR /src
COPY alpine-protoc.csproj .
RUN dotnet restore alpine-protoc.csproj

COPY . .
RUN dotnet build alpine-protoc.csproj -c Release -o /app
