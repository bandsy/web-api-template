FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["web-api-template.api/web-api-template.api.csproj", "web-api-template.api/"]
RUN dotnet restore "web-api-template.api/web-api-template.api.csproj"
COPY . .
WORKDIR /src/web-api-template.api
RUN dotnet build "web-api-template.api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "web-api-template.api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "web-api-template.api.dll"]
