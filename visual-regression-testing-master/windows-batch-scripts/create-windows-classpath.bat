rem JC 9/5/19: This batch file is curretly used for Chris Cs machine. It

cd %USERPROFILE%\Downloads\Katalon_Studio_Windows_64-6.1.1

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\visual-regression-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Anthropos/anthropos_ts" -executionProfile="default" -browserType="Chrome"





