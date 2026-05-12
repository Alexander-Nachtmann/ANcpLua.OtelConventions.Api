@echo off
:: Standard Nuke bootstrap. Invokes the local build host (build\_build.csproj).
:: All arguments are forwarded to the build host.

setlocal
pushd "%~dp0"

dotnet run --project .\build\_build.csproj -- %*

set EXITCODE=%ERRORLEVEL%
popd
endlocal & exit /b %EXITCODE%
