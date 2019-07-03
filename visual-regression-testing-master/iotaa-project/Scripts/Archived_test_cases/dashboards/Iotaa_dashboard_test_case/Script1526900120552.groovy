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

// ## JCARNEY begin custom imports for allInOne test case

// imported so to get the folder check working
import com.kms.katalon.core.configuration.RunConfiguration as RunConfiguration

// Compare images 
import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import ru.yandex.qatools.ashot.comparison.ImageDiff
import ru.yandex.qatools.ashot.comparison.ImageDiffer
import org.testng.Assert as Assert

// Try to resolve the stale element reference issue - import the StaleElementReferenceException lib
import org.openqa.selenium.StaleElementReferenceException

// Get the date and time
import java.text.SimpleDateFormat
 
/**
 * Remove previous test screenshot ( screenshot X ).
 * Compare the current screenshot ( screenshot A ), to the screenshot taken during this test ( screenshot B ).
 */
 
// Code snippet: https://gist.github.com/lifuzu/8009968
// Create the screenshots File object
def previousPng = new File( RunConfiguration.getProjectDir() + '/screenshots/previous.png' )

// Delete previous screenshot ( screenshot X )
if( previousPng.exists() ) {  
  println "previous.png " + previousPng + " exists"
  previousPng.delete()  
}

// Rename current screenshot ( screenshot A ) to previous.png, so that we have a previous 
// screenshot to compare against. 
def currentPng = new File( RunConfiguration.getProjectDir() + '/screenshots/current.png' )
if( currentPng.exists() ) {
	println "current.png " + currentPng + " exists"
	currentPng.renameTo(RunConfiguration.getProjectDir() + '/screenshots/previous.png')
}

/**
 *  Open the web browser
 */
CustomKeywords.'iotaaDashboardUtils.Utilities.openWebBrowser'()

/**
 *  @JC 7/9/18: commened out as now running saveIotaaFixture() and both runCustomScenario()
 */

/**
 * Save fixture
 */
// CustomKeywords.'iotaaDashboardUtils.Utilities.saveIotaaFixture'()

/** 
 * Run all PumpAdmin scenarios here
 */
// @JC 7/9/18: commened out
// Actionable insights
// CustomKeywords.'iotaaDashboardUtils.Utilities.runCustomScenario'('com.pumpco.iotaa.KettleUseScript')

// @JC 7/9/18: commened out
// Alerts
// CustomKeywords.'iotaaDashboardUtils.Utilities.runCustomScenario'('com.pumpco.iotaa.NoKettleInMorningScript')

/**
 * Login to the dashboard
 */
CustomKeywords.'iotaaDashboardUtils.Utilities.loginIotaaDashboard'('Bristol.office', 'password', 'IoTAA_Common_Items/AlertsCardNoRedCss')

/************************************************************************
 * Check dashboard UI
 ************************************************************************/

/**
 * Acitonable insights
 */

	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckActionableInsightsCard/ClickNotificationsDownArrow'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckActionableInsightsCard/ClickNotificationsItemRightArrow'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckActionableInsightsCard/ClickNotificationsUpArrow'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
/**
 * Alerts
 */

	// WebUI.delay(GlobalVariable.timeToWait)
	
	WebUI.click(findTestObject('IoTAA_CheckAlertsCard/ClickOnAlertsCardHeading'))
	
	// WebUI.delay(GlobalVariable.timeToWait)
	
	// @JC 17/04/18: wait for element to display in viewport ( prefered over delay() )
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'), 32)
	
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/CheckAlertsCardExists'), 32)
	
	// Click on the alert cards down arrow
	// WebUI.click(findTestObject('IoTAA_CheckAlertsCard/ClickOnAlertsCardDownArrow'))
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnCardDownButton'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/CheckAlertsCardExists'), 32)
	
	// Click on the alert items main text
	WebUI.click(findTestObject('IoTAA_CheckAlertsCard/ClickOnAlertsCardMainText'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'), 32)
	
	// Click on the left side X to go back to dashboard
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'))
	
	// @JC 17/04/18: wait for element to display in viewport ( prefered over delay() )
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/CheckAlertsCardExists'), 32)
	
	// Click on the alert items right arrow
	WebUI.click(findTestObject('IoTAA_CheckAlertsCard/ClickOnAlertItemArrow'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'), 32)
	
	// Click on the left side X to go back to dashboard
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/CheckAlertsCardExists'), 32)
	
	// Click on the alert items date and time
	WebUI.click(findTestObject('IoTAA_CheckAlertsCard/ClickOnAlertsDateTime'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'), 32)
	
	// Click on the left side X to go back to dashboard
	WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'))
	
	
/**
 * Notificaitons
 */
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckNotificationsCard/ClickOnNotificationsCardHeading'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	

// @JC 23/05/18: ##### Begin try to resolve stale element reference. see https://iotaa.manuscript.com/f/cases/207/
	// WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
	
	WebUI.waitForElementVisible(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'), 32)
	
	def didWeFindSnack = WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
	
//  // @JC 23/05/18: As its 12.30, and i cannot replicate the stale reference, i have commneted out out, but 
	// keeping around in case i need it.
//	if( didWeFindSnack == false){
//		
//		println "didWeFindSnack should be false - it is: " + didWeFindSnack
//				
//		try {
//			WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
//			
//			println "entered try statement"
//		}
//		catch (StaleElementReferenceException e) {
//			WebUI.click(findTestObject('IoTAA_Common_Items/ClickSnackbarBackToDashboard'))
//			println "entered catch statement"
//		}
//	} 

// @JC 23/05/18: ##### End try to resolve stale element reference. see https://iotaa.manuscript.com/f/cases/207/
		
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckNotificationsCard/ClickOnNotificationsDownArrow'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_CheckNotificationsCard/ClickOnNotificationsUpArrow'))
	
	// Wait a while before proceeding
	WebUI.delay(1)
		
/**
 * Tools
 */

	// Wait a while before proceeding
	WebUI.delay(1)
	
	WebUI.click(findTestObject('IoTAA_Tools/ClickOnAdminTasksButton'))
	
	// Wait a while before proceeding
	WebUI.delay(3)
	// WebUI.click(findTestObject('null'))
	
	// Click on the left side X to go back to dashboard
	def didntClickToGoBack = WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'))
	
	WebUI.waitForElementVisible(findTestObject("IoTAA_Common_Items/AlertsCardNoRedCss"), 16)
	
	if( didntClickToGoBack == false ) {
		WebUI.click(findTestObject('IoTAA_Common_Items/ClickOnAppflowXToGoBack'))
	}
	
	// Wait a while before proceeding
	WebUI.delay(1)

	/**
	 * Check if a screenshots folder exists, and whether there are screenshots within.
	 * Change dates to avoid false failures, then take current screenshot ( screenshot B ). 
	 */
	
	// Tutorial: https://www.mkyong.com/java/how-to-check-if-directory-is-empty-in-java/
	println "Starting check to see if screenshots folder is empty"
	
	// Code snippet: https://gist.github.com/lifuzu/8009968
	// Create the screenshots File object
	def folder = new File( RunConfiguration.getProjectDir() + '/screenshots' )		
	// If screenshots doesn't exist create it, else, do nothing
	if( folder.exists() ) {
	  
	  println "folder " + folder + " exists"
	  
	} else {
		folder.mkdir()
		
	}

	File screenshotsDirPath = new File( RunConfiguration.getProjectDir() + '/screenshots' );
	println "screenshotsDirPath is: " + screenshotsDirPath
	
	// Groovy check file exists: https://stackoverflow.com/questions/39262999/groovy-file-check
	def DS_StorePath = RunConfiguration.getProjectDir() + '/screenshots/.DS_Store'
	def DS_StoreFile = new File(DS_StorePath)
	
	// If the DS_StoreFile exists, delete it
	// Tutorial: http://groovy-almanac.org/deleting-a-file/
	if( DS_StoreFile.exists() ) {
		boolean DS_StoreFileSuccessfullyDeleted = DS_StoreFile.delete()
		println "DS_StoreFileSuccessfullyDeleted is: " + DS_StoreFileSuccessfullyDeleted
	}
	
	if(screenshotsDirPath.isDirectory()){
		println "screenshotsDirPath.isDirectory() is: " + screenshotsDirPath.isDirectory()
		if(screenshotsDirPath.list().length>0){
			
			System.out.println("screenshotsDirPath.list().length is: " + screenshotsDirPath.list().length )
			System.out.println("Directory is empty!");
			
				
		}else{
				
			/**
			 * Take screenshot B, then change the dates to stop false failures.
			 */
	
			System.out.println("Directory is NOT empty!");
			
			WebUI.waitForElementVisible(findTestObject("IoTAA_Common_Items/AlertsCardNoRedCss"), 16)
			
			// Change the date and time for all cards, so that screenshot comparisons dont fail
			//def allDateTimes
			WebUI.executeJavaScript('var allDateTimes = document.querySelectorAll("[data-bind*=\'text:$parent.parseDate\']"); for(var i=0; i<allDateTimes.length; i++) { allDateTimes[i].textContent = "15-Jan-18, 09:30"; }', null)

			// Check we did actually change the date time, if not, try it again. The JS execution hasnt ran in previous tests so this acts as a failsafe
			WebUI.executeJavaScript('var allDateTimes = document.querySelectorAll("[data-bind*=\'text:$parent.parseDate\']"); for(var i=0; i<allDateTimes.length; i++) { if( allDateTimes[i].textContent !== "15-Jan-18, 09:30" ) { allDateTimes[i].textContent = "15-Jan-18, 12:30"; } }', null)
			
			CustomKeywords.'iotaaDashboardUtils.Utilities.takeYesterdaysScreenshot'()							
		}
		
	}else{
			
		System.out.println("This is not a directory");
		
	}
	
	println "Ending check to see if folder is empty"
	
	/**
	 * Compare screenshots
	 */
	
	/**
	 * @JC 25/06/18: start: i dont tink we need these lines
	 */
	WebUI.waitForElementVisible(findTestObject("IoTAA_Common_Items/AlertsCardNoRedCss"), 16)
	
	// Change the date and time for all cards, so that screenshot comparisons dont fail
	WebUI.executeJavaScript('var allDateTimes = document.querySelectorAll("[data-bind*=\'text:$parent.parseDate\']"); for(var i=0; i<allDateTimes.length; i++) { allDateTimes[i].textContent = "15-Jan-18, 09:30"; }', null)

	// Check we did actually change the date time, if not, try it again. The JS execution hasnt ran in previous tests so this acts as a failsafe
	WebUI.executeJavaScript('var allDateTimes = document.querySelectorAll("[data-bind*=\'text:$parent.parseDate\']"); for(var i=0; i<allDateTimes.length; i++) { if( allDateTimes[i].textContent !== "15-Jan-18, 09:30" ) { allDateTimes[i].textContent = "15-Jan-18, 12:30"; } }', null)

	/**
	 * @JC 25/06/18: end: i dont tink we need these lines
	 */
	
	Assert.assertFalse(CustomKeywords.'com.at.util.ScreenshotHelper.compareImages'())
	
	WebUI.closeBrowser()
	
	
	
	