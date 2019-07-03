echo environment = %1
echo browser = %2
echo headless = %3

cd %USERPROFILE%\repository\visual-regression-testing

cd %USERPROFILE%\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\Reports\Anthropos

rmdir anthropos_ts /S /Q

cd %USERPROFILE%\Documents\katalon_studio

IF "%3"=="" (katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Anthropos/installationTool/installationTool" -executionProfile="%1" -browserType="%2" -apiKey=78ee48c3-0b3f-4195-a3bb-6a3b49df6d6f) ELSE IF "%3"=="(headless)" (katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Anthropos/installationTool/installationTool" -executionProfile="%1" -browserType="%2 %3" -apiKey=78ee48c3-0b3f-4195-a3bb-6a3b49df6d6f)
