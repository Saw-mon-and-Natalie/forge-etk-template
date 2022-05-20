@echo off
for /f %%i in ('eas %1') do set BYTECODE=%%i
echo 0x%BYTECODE%