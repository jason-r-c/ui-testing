cd $HOME/Downloads/Katalon_Studio_Linux_64-5.4.1

./katalon --args -email="jason.carney@pumpco.co.uk" -password="jcTest123" -noSplash -consoleLog -runMode=console -projectPath="$HOME/repository/katalon-testing/iotaa-project/iotaa-project.prj" -statusDelay=5 -retry=3 -retryFailedTestCases=true -testSuitePath="Test Suites/ActionableInsights" -browserType="Chrome"
