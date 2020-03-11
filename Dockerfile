FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY web-api-template.sln ./
COPY web-api-template.data/*.csproj ./web-api-template.data/
COPY web-api-template.api/*.csproj ./web-api-template.api/
COPY web-api-template.unit-tests/*.csproj ./web-api-template.unit-tests/

RUN dotnet restore
COPY . .
WORKDIR /src/web-api-template.data
RUN dotnet build -c Release -o /app

WORKDIR /src/web-api-template.api
RUN dotnet build -c Release -o /app

WORKDIR /src/web-api-template.unit-tests
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "web-api-template.api.dll"]
