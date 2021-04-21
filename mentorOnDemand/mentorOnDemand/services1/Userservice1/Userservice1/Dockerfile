FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["Userservice1/Userservice1.csproj", "Userservice1/"]
RUN dotnet restore "Userservice1/Userservice1.csproj"
COPY . .
WORKDIR "/src/Userservice1"
RUN dotnet build "Userservice1.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Userservice1.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Userservice1.dll"]