FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["UralAirReporter.Api/UralAirReporter.Api.csproj", "UralAirReporter.Api/"]
RUN dotnet restore "UralAirReporter.Api/UralAirReporter.Api.csproj"
COPY . .
WORKDIR "/src/UralAirReporter.Api"
RUN dotnet build "./UralAirReporter.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./UralAirReporter.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "UralAirReporter.Api.dll"]
