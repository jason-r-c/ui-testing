cd %USERPROFILE%\repository\katalon-testing\iotaa-project\Reports\Bdd

rmdir loginToDashboard_Bdd /S /Q

cd %USERPROFILE%\Documents\katalon_studio

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\katalon-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Bdd/loginToDashboard_Bdd" -browserType="Chrome"




