docker build --pull --rm -f "Dockerfile.sdk.alpine" -t perdub/dotnet-images:tmp1 "."
docker build --pull --rm -f "Dockerfile.runtime.alpine" -t perdub/dotnet-images:tmp2 "."

docker tag perdub/dotnet-images:tmp1 perdub/dotnet-images:sdk-alpine-${GITHUB_RUN_ATTEMPT}
docker tag perdub/dotnet-images:tmp1 perdub/dotnet-images:sdk-alpine-latest
docker tag perdub/dotnet-images:tmp2 perdub/dotnet-images:runtime-alpine-${GITHUB_RUN_ATTEMPT}
docker tag perdub/dotnet-images:tmp2 perdub/dotnet-images:runtime-alpine-latest

docker image push perdub/dotnet-images:sdk-alpine-${GITHUB_RUN_ATTEMPT}
docker image push perdub/dotnet-images:sdk-alpine-latest
docker image push perdub/dotnet-images:runtime-alpine-${GITHUB_RUN_ATTEMPT}
docker image push perdub/dotnet-images:runtime-alpine-latest