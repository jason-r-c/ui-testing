
CD  %USERPROFILE%\katalon-testing\iotaa-project\Reports\
:: del *.* /F /Q
rmdir iotaa_test_cases\ /s /q
rmdir iotaa_local_office_first_time_setup\ /s /q
rmdir iotaa_local_office_continuous_tests\ /s /q



:: https://stackoverflow.com/questions/203090/how-do-i-get-current-datetime-on-the-windows-command-line-in-a-suitable-format

:: testing
:: cd katalon-testing\iotaa-project\Reports

@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set theday=%%b)
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set themonth=%%a)
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set theyear=%%c)
echo %mydate%

:: take away days
set /A thedaycount=%theday% -7

echo %thedaycount%

set /A themonthcount=%themonth%
echo %themonthcount%

set /A theyearcount=%theyear%

set /A datesevenago=%theyearcount%%themonth%%thedaycount%

echo %datesevenago%
