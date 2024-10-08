
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app


RUN apt-get update && apt-get install -y curl


COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app


RUN apt-get update && apt-get install -y curl

COPY --from=build /app/out ./

ENTRYPOINT ["dotnet", "SampleBackend.dll"]
