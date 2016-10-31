@echo Off

rem ****************************************************************************
rem To update the version edit build\Microsoft.AspNet.SignalR.versions.targets
rem ****************************************************************************


rem Enforce package restore to avoid build issues. See http://go.microsoft.com/fwlink/?LinkID=317568 for more details
msbuild .nuget\NuGet.targets /t:RestorePackages
.nuget\nuget.exe restore %~dp0\src\Microsoft.AspNet.SignalR.Client.UWP\project.json

set target=%1
if "%target%" == "" (
   set target=BuildPackages
)
set config=%2
if "%config%" == "" (
   set config=Release
)

msbuild Build\Build.proj /t:"%target%" /p:Configuration="%config%";BUILD_NUMBER=5;PRERELEASE=false;Nightly=false /m /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false