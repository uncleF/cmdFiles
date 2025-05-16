:: Web Project Cleanup

@echo off

if exist node_modules (
    echo Deleting node_modules...
    rmdir /s /q node_modules
) else (
    echo node_modules folder not found.
)
