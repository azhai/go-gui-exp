@ECHO OFF

REM USAGE:
REM     make      Rebuild the project
REM     make mod  Install all packages and rebuild the project

IF "%1" == "" GOTO all
IF "%1" == "all" GOTO all
IF "%1" == "build" GOTO build

:mod
    go.exe mod tidy
    go.exe mod vendor
:all
    del adm.exe
:build
    go.exe build -ldflags="-s -w -H=windowsgui" -mod=vendor -o adm.exe .
