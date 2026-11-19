# Стадия сборки
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY . .

RUN dotnet restore src/CinemaWebsite.Api/CinemaWebsite.Api.csproj
RUN dotnet publish src/CinemaWebsite.Api/CinemaWebsite.Api.csproj \
    -c Release \
    -o /app/publish \
    --no-restore

# Стадия запуска
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "CinemaWebsite.Api.dll"]
