#!/bin/bash
pushd "${0%/*}" > /dev/null 
if [ ! -z $APPVEYOR_BUILD_VERSION ]; then _VersionProp="/p:VersionPrefix=$APPVEYOR_BUILD_VERSION"; fi
if [ ! -z $BUILDVERSION ]; then _VersionProp="/p:VersionPrefix=$BUILDVERSION"; fi
dotnet restore
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=osx-x64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=debian.10-x64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=ubuntu.18.04-x64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=ubuntu.18.04-arm64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=ubuntu.20.04-x64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=ubuntu.20.04-arm64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=opensuse.15.0-x64 $_BuildProp $_VersionProp $@
dotnet msbuild /t:Package /p:Configuration=Release /p:WindowsOnly=false /p:TargetFramework=net6.0 /p:RuntimeIdentifier=fedora.34-x64 $_BuildProp $_VersionProp $@

popd
