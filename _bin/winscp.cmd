@echo off
REM Enable delayed expansion for variable processing
setlocal enabledelayedexpansion

REM Load environment variables from .env file
if exist .env (
    for /f "usebackq tokens=* delims=" %%A in (".env") do (
        set "line=%%A"
        REM Ignore empty lines and lines starting with # (comments)
        if not "!line!"=="" if not "!line:~0,1!"=="#" (
            for /f "tokens=1,2 delims==" %%B in ("!line!") do set "%%B=%%C"
        )
    )
)
.\_bin\winscp.exe /script=.\_bin\winscp_script.txt /log=.\winscp.log /ini=nul