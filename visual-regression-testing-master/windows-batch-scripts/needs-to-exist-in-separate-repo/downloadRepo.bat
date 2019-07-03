cd C:\Users\anthr\repository

taskkill /IM "katalon.exe" /F

RMDIR /Q/S katalon-testing

cd C:\Users\anthr\Documents\katalon_studio

katalon -noSplash  -runMode=console -projectPath="%USERPROFILE%\repository\refresh-katalon\refrshKatalon\refrshKatalon.prj" -retry=0 -testSuitePath="Test Suites/removeKatalonRepo" -browserType="Chrome"

cd C:\Users\anthr\Downloads

rename katalon-testing-master.zip katalon-testing.zip

cd C:\Users\anthr\Documents\7zip

7za.exe x -y C:\Users\anthr\Downloads\katalon-testing.zip -oc:\Users\anthr\repository\katalon-testing

cd C:\Users\anthr\Downloads

del katalon-testing.zip