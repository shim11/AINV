@echo off
set LOGFILE=c:\Temp\2020_1_24_13_1.log
call :LOG > %LOGFILE%
exit /B
:LOG
setlocal
set PGPASSWORD=ag1616
"D:\Program Files\PostgreSQL\bin\psql.exe" --host localhost --port 5432 --username "alon" --dbname "AlonDb" --command="update profitreport pr set vendor=(select vendor from ai_items i where i.sku=pr.sku and vendor>'') where vendor='' or vendor is null"
endlocal
