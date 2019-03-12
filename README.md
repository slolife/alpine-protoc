Sample repository for the following grpc issue: https://github.com/grpc/grpc/issues/18338

build docker with:

`docker build .`

That will fail with the following error message:

`/root/.nuget/packages/grpc.tools/1.19.0/build/_protobuf/Google.Protobuf.Tools.targets(263,5): error MSB6003: The specified task executable "/root/.nuget/packages/grpc.tools/1.19.0/tools/linux_x64/protoc" could not be run. No such file or directory [/src/alpine-protoc.csproj]`

Comment out the last line in the docker image to create the image, and then run the command from the shell.