import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable


// JCARNEY 6/6/19: When running multiple features, and if/when an error occurrs, the JUnit test report states the test suite is incomplete.
// For an example, see: 
// file:///Users/jasoncarney/repository/visual-regression-testing/iotaa-project/Reports/Anthropos/installationTool/installationTool/20190606_204845/20190606_204845.html
// Running this in jenkins, gives us a PASS result, which is incorrect.
CucumberKW.runFeatureFile('Include/features/Anthropos/developmentTools/resetData.feature')

CucumberKW.runFeatureFile('Include/features/Anthropos/dataGeneration/hiaAdmin_generateInstallationRequestContent.feature')

CucumberKW.runFeatureFile('Include/features/Anthropos/installationTool/installToolAdminInstalls.feature')

// JCARNEY 6/6/19: Also dosnt work.
// file:///Users/jasoncarney/repository/visual-regression-testing/iotaa-project/Reports/Anthropos/installationTool/installationTool/20190606_210602/20190606_210602.html
//WebUI.callTestCase(findTestCase('Anthropos/installationTool/hiaAdmin/resetData'), [:], FailureHandling.OPTIONAL)
//
//WebUI.callTestCase(findTestCase('Anthropos/installationTool/hiaAdmin/generateOrder'), [:], FailureHandling.OPTIONAL)
//
//WebUI.callTestCase(findTestCase('null'), [:], FailureHandling.OPTIONAL)
//
