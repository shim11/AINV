@echo off
set LOGFILE=c:\Temp\2020_1_24_13_2.log
call :LOG > %LOGFILE%
exit /B
:LOG
setlocal
set PGPASSWORD=ag1616
"D:\Program Files\PostgreSQL\bin\psql.exe" --host localhost --port 5432 --username "alon" --dbname "AlonDb" --command="update profitreport pr set ainvcost= sub.mycost from  ai_items as sub where mycost <> ainvcost and sub.sku=pr.sku and mycost > 0"
endlocal
