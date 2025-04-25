@echo off
REM Script to enable git hooks in a new repository

REM Check if .git directory exists
if not exist .git (
    echo Error: .git directory not found. Please run this script from the root of a git repository.
    exit /b 1
)

REM Copy post-* hooks from _bin to .git/hooks
xcopy /Y "_bin\post-*" ".git\hooks\"

REM Make sure hooks are executable (if on a system that requires it)
echo Git hooks have been successfully copied.
pause