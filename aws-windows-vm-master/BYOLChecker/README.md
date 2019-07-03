Prerequisites :
1) Powershell version should be greater than or equal to 4. 

How to use the script :
1) create a working directory where the logs and output will be generated.
2) open a powershell console and cd to your working directory.
3) run Set-ExecutionPolicy Unrestricted
3) run <PATH_TO_YOUR_SCRIPT_DIRECTORY>\BYOLChecker.ps1
4) A UI will pop up, click "Begin Tests"
5) This will take a while and you will be able to see the live view of tests progress.
6) Once the tests finish, in case of failed tests, you can click the "info" button to find a remedy.
7) Warnings Errors can be fixed by clickeing on the "Auto Fix"
8) Failed Errors must be addressed manually
7) For more detailed logs you can check the ImageInfo.txt and BYOLPrevalidationlog<TIMESTAMP>.txt
