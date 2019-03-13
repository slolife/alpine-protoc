Sample repository for the following grpc issue and StackOverflow question:

https://github.com/grpc/grpc/issues/18338

https://stackoverflow.com/questions/55128227/cannot-run-grpc-protoc-in-alpine-based-dotnet-sdk

# Branches
## master

Current workaround which adds `libc6-compat` and `protoc` apk packages and symlinks the packaged protoc to the Grpc.Tools directory.

## initial-problem

Shows initial issue with the following error:

   `/root/.nuget/packages/grpc.tools/1.19.0/build/_protobuf/Google.Protobuf.Tools.targets(263,5): error MSB6003: The specified task executable "/root/.nuget/packages/grpc.tools/1.19.0/tools/linux_x64/protoc" could not be run. No such file or directory [/src/alpine-protoc.csproj]`

## libc6-compat-workaround

An attempt to add libc6-compat apk package, which results in a segmentation fault.

   `/root/.nuget/packages/grpc.tools/1.19.0/build/_protobuf/Google.Protobuf.Tools.targets(263,5): error MSB6006
: "/root/.nuget/packages/grpc.tools/1.19.0/tools/linux_x64/protoc" exited with code 139. [/src/alpine-proto
c.csproj]`

# Notes
Comment out the last line in the docker image to create the image, and then run the command from the shell.
