echo environment = %1
echo browser = %2
echo headless = %3

cd %USERPROFILE%\repository\katalon-testing

git checkout -- .

cd %USERPROFILE%\repository\katalon-testing\iotaa-project\Reports\Anthropos

rmdir liveAndMock_ts /S /Q

cd %USERPROFILE%\Documents\katalon_studio

IF "%3"=="" (katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\katalon-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Anthropos/liveAndMock_ts" -executionProfile="%1" -browserType="%2") ELSE IF "%3"=="(headless)" (katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\katalon-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Anthropos/liveAndMock_ts" -executionProfile="%1" -browserType="%2 %3")
