import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory as CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as MobileBuiltInKeywords
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testcase.TestCaseFactory as TestCaseFactory
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testdata.TestDataFactory as TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository as ObjectRepository
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WSBuiltInKeywords
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUiBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys
// Import class so we can access IS_OS_MAC and IS_OS_WINDOWS
import org.apache.commons.lang.SystemUtils as Utils
// Import class for testing assertions
import org.testng.Assert as Assert
// Get the date and time
import java.text.SimpleDateFormat as SimpleDateFormat
// try to get RunConfiguration working
import com.kms.katalon.core.configuration.RunConfiguration as RunConfiguration

// Open the selected browser (from the Katalon GUI)
WebUI.openBrowser('')

// Set viewport size 703x347
WebUI.maximizeWindow()

/** @JC Resources **********************************************************************************************************************************
 * 
 * Groovy: check if file exists :https://stackoverflow.com/questions/39262999/groovy-file-check
 * 
 **************************************************************************************************************************************************/
/** @JC Testing ************************************************************************************************************************************

// https://stackoverflow.com/questions/4689240/detecting-the-platform-window-or-linux-by-groovy-grails
//if (System.properties['os.name'].toLowerCase().contains('windows')) {
//	println "it's Windows"
//	
//} else {
//	println "it's not Windows"
//	
//}
// println(Utils.IS_OS_MAC)
 
****************************************************************************************************************************************************/
// Set the environment to dev.cnect.to for Mac or at.cnect.to for Windows
if (Utils.IS_OS_MAC) {
    // No def or String so we can access outside of block scope
    // http://mrhaki.blogspot.co.uk/2009/11/groovy-goodness-variable-scope-in.html
    env = 'dev'
} else if (Utils.IS_OS_WINDOWS) {
    env = 'at'
}

/***************************************************************************************************************************************************
 * // Run setup demo script 
 **************************************************************************************************************************************************/
// Access the refixture page in PumpAdmin
// Pass basic http auth on Windows, Mac and Linux by passing username and password through the url.
// We can access the variable env as its global scope.
WebUI.navigateToUrl(('https://admin:r353tFixture@' + env) + '.cnect.to/PumpHouse/pumpAdmin/refixture')

/* BEGIN @JC 28/03/18 */
// Click on the Save fixture in PumpAdmin
WebUI.click(findTestObject('IoTAA_PumpAdmin/a_Save Fixture'))

// Select iotaa from the drop down list
WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/select_BetterTogetherBetterTog'), 'Iotaa', true)

WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))

// Click the Drop Database radio button
WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

// Type password
WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')

// Click the Submit button to save the fixture
WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

// Verify the iotaa fixture has been saved 
WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 30)

// Select the Scripts page from PumpAdmin
WebUI.click(findTestObject('IoTAA_PumpAdmin/a_Scripts'))

// Select SetupDemoScript from the drop down list
WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), 'com.pumpco.iotaa.SetupDemoScript', 
    true)

// Click the Run button to execute the SetupDemoScript
WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

// Verify setup demo script has ran 
WebUI.verifyTextPresent('executed script com.pumpco.iotaa.SetupDemoScript', false)

/* END @JC 28/03/18 */
/*********************************************************************************************************************
 * // Run the AttendanceInScript script
 ********************************************************************************************************************/
/* BEGIN @JC 28/03/18 */
// Navigate to the Scripts page in PumpAdmin
WebUI.navigateToUrl(('https://' + env) + '.cnect.to/PumpHouse/pumpAdmin/scripts')

// Select AttendanceInScript from the drop down list
WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), 'com.pumpco.iotaa.AttendanceInScript', 
    true)

// Click the Run button to execute the AttendanceInScript script
WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query (1)'))

/*END @JC 28/03/18 */
// Navigate to the iotaa dashboard
WebUI.navigateToUrl(('https://' + env) + '.cnect.to/iotaa')

// Refresh the current web page
WebUI.refresh()

// Wait a while before proceeding
WebUI.delay(6)

// Type in the iotaa username 
WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2'), 'kathy.dawson')

// Type in the users password
WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2_1'), 'password')

// Click the remember radio button
WebUI.click(findTestObject('IoTAA_Common_Items/LoginPage_RememberMeRadioBtn'))

// Sign in to the dashboard
WebUI.click(findTestObject('IoTAA_Common_Items/button_sign in'))

// Wait a while before proceeding
WebUI.delay(6)

// wait for the page to render
WebUI.waitForElementPresent(findTestObject('DeleteMe/Page_IoTAA - The Business of IoT/div_Notifications'), 16)

// WebUI.click(findTestObject('DeleteMe/Page_IoTAA - The Business of IoT/div_Notifications'))

// Take screenshot after logging in
// def keyword appears to work when used in a class method
// resource: https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
def today = new Date()

// take away one date from today
// resource: https://stackoverflow.com/questions/8816990/subtract-a-date-by-1-or-2-in-groovy
def yesterday = today - 1

//println yesterday.format("dd-MM-yyyy")
def sdf = new SimpleDateFormat('dd-MM-yyyy' // to add hours, mins, secs - HH-mm-ss
)

//println sdf.format(today)
println('\n')

println(((('Yesterdays date was: ' + RunConfiguration.getProjectDir()) + '/screenshots/sc_') + yesterday.format('dd-MM-yyyy')) + 
    '.png \n')

println(((('Todays date is: ' + RunConfiguration.getProjectDir()) + '/screenshots/sc_') + sdf.format(today)) + '.png \n')

println(('The current project folder is: ' + RunConfiguration.getProjectDir()) + '\n')

// Take a screenshot
WebUI.takeScreenshot(((RunConfiguration.getProjectDir() + '/screenshots/sc_') + yesterday.format('dd-MM-yyyy')) + '.png')

// Close browser when all is done!
WebUI.closeBrowser()




// WebUI.click(findTestObject('Page_IoTAA - The Business of IoT/button_Notifications'))


