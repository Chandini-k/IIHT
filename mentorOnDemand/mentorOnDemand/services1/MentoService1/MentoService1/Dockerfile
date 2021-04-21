FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["MentoService1/MentoService1.csproj", "MentoService1/"]
RUN dotnet restore "MentoService1/MentoService1.csproj"
COPY . .
WORKDIR "/src/MentoService1"
RUN dotnet build "MentoService1.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MentoService1.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MentoService1.dll"]