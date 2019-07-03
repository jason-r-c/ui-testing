cd %USERPROFILE%\repository\katalon-testing\iotaa-project\Reports\Environments

rmdir Live /S /Q

cd %USERPROFILE%\Documents\katalon_studio

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\katalon-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Environments\Live" -browserType="Chrome"
