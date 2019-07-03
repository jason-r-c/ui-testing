echo test environment = %1

cd %USERPROFILE%\repository\katalon-testing\iotaa-project\Reports\Bdd

rmdir loginAsInstallationEngineer_bdd /S /Q

cd %USERPROFILE%\Documents\katalon_studio

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\katalon-testing\iotaa-project\iotaa-project.prj" -retry=0 -testSuitePath="Test Suites/Bdd/loginAsInstallationEngineer_bdd" -executionProfile="%1" -browserType="Chrome (headless)"
