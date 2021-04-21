FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["Admin1services/Admin1services.csproj", "Admin1services/"]
RUN dotnet restore "Admin1services/Admin1services.csproj"
COPY . .
WORKDIR "/src/Admin1services"
RUN dotnet build "Admin1services.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Admin1services.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Admin1services.dll"]