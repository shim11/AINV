@echo off
set LOGFILE=c:\Temp\2019_1_7_21_5.log
call :LOG > %LOGFILE%
exit /B
:LOG
setlocal
set PGPASSWORD=ag1616
"D:\Program Files\PostgreSQL\bin\psql.exe" --host localhost --port 5432 --username "alon" --dbname "AlonDb" -a -f "c:\Temp\UpdateCaseQty.sql"
endlocal
