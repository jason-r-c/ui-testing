echo environment = %1
echo browser = %2
echo headless = %3

cd %USERPROFILE%\repository\visual-regression-testing

cd %USERPROFILE%\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\Reports\Anthropos

rmdir anthropos_ts /S /Q

cd %USERPROFILE%\Documents\katalon_studio

REM katalon -noSplash  -runMode=console -projectPath="C:\Users\anthr\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\iotaa-project.prj" -retry=0 -testSuiteCollectionPath="Test Suites/Anthropos/testSuiteCollectionFolder/integration"

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\visual-regression-testing\visual-regression-testing-master\iotaa-project\iotaa-project.prj" -retry=0 retryFailedTestCases=true -testSuiteCollectionPath="Test Suites/anthroposEnvironmentsTestSuiteCollection/nightly" -apiKey=78ee48c3-0b3f-4195-a3bb-6a3b49df6d6f