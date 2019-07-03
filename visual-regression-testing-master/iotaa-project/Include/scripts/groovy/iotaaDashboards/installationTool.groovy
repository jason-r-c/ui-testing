package iotaaDashboards
import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testcase.TestCaseFactory
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testdata.TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords

// import internal.GlobalVariable
import internal.GlobalVariable as GlobalVariable

import MobileBuiltInKeywords as Mobile
import WSBuiltInKeywords as WS
import WebUiBuiltInKeywords as WebUI

import org.openqa.selenium.WebElement
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By

import com.kms.katalon.core.mobile.keyword.internal.MobileDriverFactory
import com.kms.katalon.core.webui.driver.DriverFactory

import com.kms.katalon.core.testobject.RequestObject
import com.kms.katalon.core.testobject.ResponseObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.TestObjectProperty

import com.kms.katalon.core.mobile.helper.MobileElementCommonHelper
import com.kms.katalon.core.util.KeywordUtil

import com.kms.katalon.core.webui.exception.WebElementNotFoundException

import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// @JC 28/2/19: import the custom Utilities keyword
import iotaaDashboardUtils.Utilities as anthrUtils

// @JC 1/3/19: print Groovy object contents
import groovy.json.JsonOutput

// @JC 4/3/19: use date time lib
import java.text.SimpleDateFormat

// @JC 4/3/19: use to run js
import org.openqa.selenium.JavascriptExecutor

// @JC: 12/3/19
//import iotaaDashboardUtils.testRegExStuff



class installationTool {

	//	/**
	//	 * @scenario playground:
	//	 * testing playground
	//	 */
	//	// @Given(/^[0-9]*$/)
	//	@Given(/^.*click me.*$/)
	//	def testPlayground() {
	//		//
	//		//		def stringifiedObject =  JsonOutput.toJson(selectIotTestClient)
	//		//		println JsonOutput.prettyPrint(stringifiedObject)
	//		//
	//
	//		// println '\n GlobalVariable.G_SiteURL is:' + GlobalVariable.SiteURL + '\n'
	//		// println '\n GlobalVariable.G_SiteURL is:' + GlobalVariable.G_SiteURL + '\n'
	//		println '\n GlobalVariable.G_SiteURL is:' + GlobalVariable.G_SiteURL + '\n'
	//
	//		// open the browser
	//		def anthrUtil = new anthrUtils()
	//		anthrUtil.openWebBrowser()
	//
	//		WebUI.navigateToUrl(GlobalVariable.G_SiteURL)
	//
	//		String currentPage = 'https://admin:r353tFixture@dev.cnect.to/PumpHouse/pumpAdmin/refixture'
	//
	//		int currentTab = WebUI.getWindowIndex()
	//
	//		WebDriver driver = DriverFactory.getWebDriver()
	//
	//		JavascriptExecutor js = ((driver) as JavascriptExecutor)
	//
	//		js.executeScript('window.open();')
	//
	//		WebUI.switchToWindowIndex(currentTab + 1)
	//
	//		// WebUI.navigateToUrl('https://dev.cnect.to/iotaa')
	//
	//		// WebUI.navigateToUrl(path)
	//
	//		WebUI.switchToWindowIndex(currentTab)
	//
	//		// WebUI.navigateToUrl(currentPage)
	//	}

	//

	/**
	 * @scenario 0:
	 * Save iotaa fixture
	 */
	//	@Given("that I go to PumpAdmin fixtures list")
	//	def goToPumpAdminFixtureList() {
	//
	//		// open the browser
	//		def anthrUtil = new anthrUtils()
	//		anthrUtil.openWebBrowser()
	//
	//		// go to pumpadmin
	//		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/pumpAdmin/refixture')
	//	}

	//	@And("I select Iotaa fixture")
	//	def selectIotaaFixture() {
	//		// Select iotaa from the drop down list
	//		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/select_BetterTogetherBetterTog'), 'Iotaa', false)
	//	}


	//	@And("drop the database")
	//	def dropDb() {
	//		// Click the Drop Database radio button
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))
	//
	//		// Click submit
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	//
	//	}

	//	@And("Confirm the password")
	//	def confirmFixtureSavePassword() {
	//		// Type password
	//		WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')
	//	}

	//	@Then("Click submit")
	//	def saveIotaaFixture() {
	//		// Click the Submit button to save the fixture
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	//
	//		// Verify the iotaa fixture has been saved
	//		WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 10)
	//
	//	}



	/**
	 * @scenario 1:
	 * Run PumpAdmin setup demo script
	 */
	//	@Given("that I go to PumpAdmin")
	//	def goToPumpAdmin() {
	//
	//		// open the browser
	//		//		def anthrUtil = new anthrUtils()
	//		//		anthrUtil.openWebBrowser()
	//
	//		// go to pumpadmin
	//		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/pumpAdmin/scripts')
	//	}
	//
	//	@And("I select SetupDemoScript")
	//	def setupDemoScript() {
	//		// Select SetupDemoScript from the drop down list
	//		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), 'com.pumpco.iotaa.SetupDemoScript', false)
	//	}
	//
	//	@And("I click the run button")
	//	def runSetupDemoScript() {
	//		// Click the Run button to execute the SetupDemoScript
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	//	}
	//
	//	@Then("ensure that the app flow status is complete")
	//	def setupDemoScriptComplete() {
	//		// Verify setup demo script has ran
	//		WebUI.verifyTextPresent('executed script com.pumpco.iotaa.SetupDemoScript', false)
	//	}

	/**
	 * @scenario 2:
	 * Run PumpAdmin order and preinstall script
	 */

	//	// ** Reuse scenario 1: go to pumpadmin scripts
	//
	//	@And("I select NewAnthroposOrderAndPreInstallScript")
	//	def selectOrder() {
	//		// Select AttendanceInScript from the drop down list
	//		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'),
	//				'com.pumpco.iotaa.NewAnthroposOrderAndPreInstallScript', false)
	//	}
	//
	//	// ** Reuse scenario 1: click run button
	//
	//	@Then("ensure NewAnthroposOrderAndPreInstallScript successfully run")
	//	def confirmOrderScriptRan() {
	//		// Verify setup demo script has ran
	//		WebUI.verifyTextPresent('com.pumpco.iotaa.NewAnthroposOrderAndPreInstallScript', false)
	//	}

	/**
	 * @scenario 4:
	 * Install Tool Logon
	 */

	//	def anthrUtil = new anthrUtils()
	//
	//	@Given("that I go to the test environment")
	//	def goToTestEnvironment() {
	//		anthrUtil.openWebBrowser()
	//		// https://iotaa-test.anthropos.io/anthropos
	//		// WebUI.navigateToUrl('https://iotaa-test.anthropos.io/anthropos')
	//		if(GlobalVariable.G_SiteURL == 'dev.cnect.to') {
	//			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + GlobalVariable.G_iotaaPathPostfix)
	//		} else {
	//			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL)
	//		}
	//	}
	//
	//	// Type in the iotaa username
	//	@And("I enter the username (.*)")
	//	def enterUsername(String username)	{
	//		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2'), username)
	//	}
	//
	//	@And('enter the password (.*)')
	//	def enterPassword(String password) {
	//		// Type in the users password
	//		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2_1'), password)
	//	}
	//
	//	@And('I click the login button')
	//	def signIn() {
	//		// Sign in to the dashboard
	//		WebUI.click(findTestObject('IoTAA_Common_Items/button_sign in'))
	//	}
	//
	//	@Then('ensure the dashboard is visible')
	//	def dashboardVisible() {
	//		def dashboardVisible = new TestObject('dashboardVisible')
	//		dashboardVisible.addProperty("xpath", ConditionType.EQUALS, "//*[contains(@class,'main-body')]", true)
	//		WebUI.verifyElementVisible(dashboardVisible)
	//
	//		def stringifiedObject =  JsonOutput.toJson(dashboardVisible)
	//		println JsonOutput.prettyPrint(stringifiedObject)
	//	}

	/**
	 * @scenario 5:
	 * Install Tool Select Client
	 */
	//	// @Given('I select the client drop down icon')
	//	@Given('I select the ([a-z]{1,20}) drop down icon in the (.*) card')
	//	def selectClientDropDown(String a, String b) {
	//		def itemNumber = ""
	//
	//		switch(a) {
	//			//There is case statement defined for 4 cases
	//			// Each case statement section has a break condition to exit the loop
	//
	//			case "first":
	//				itemNumber = '[1]';
	//				println("Select 1st item");
	//				break;
	//			case "second":
	//				itemNumber = '[2]';
	//				println("Select 2nd item");
	//				break;
	//			case "third":
	//				itemNumber = '[3]';
	//				println("Select 3rd item");
	//				break;
	//			case "fourth":
	//				itemNumber = '[4]';
	//				println("Select 4th item");
	//				break;
	//			default:
	//				itemNumber = '[1]';
	//				println("Default to the first item");
	//				break;
	//		}
	//
	//		def clientDropDown = new TestObject('clientDropDown')
	//		clientDropDown.addProperty("xpath", ConditionType.EQUALS,
	//				"(//*[contains(text(),'" + b + "')]/ancestor::div[@class='iotaa-card-list']//*[contains(@class, 'btn-expander')])"+itemNumber, true)
	//		WebUI.click(clientDropDown)
	//
	//		// -- (//*[contains(text(),'My Install Requests')]/ancestor::div[@class='iotaa-card-list']//*[contains(@class, 'btn-expander')])[4]
	//	}

	//	@And('I select start')
	//	def selectStartReqestButton() {
	//		def selectStartReqestButton = new TestObject('selectStartReqestButton')
	//		selectStartReqestButton.addProperty("xpath", ConditionType.EQUALS,
	//				"(//div[contains(@class,'iotaa-card dashboard-card')])[1]//button[contains( text(), 'Start' )]", true)
	//		WebUI.click(selectStartReqestButton)
	//	}

	//	@And('I select Accept Installation Request from the drop down menu')
	//	def acceptRequestFromDropDown() {
	//		def acceptRequestFromDropDown = new TestObject('acceptRequestFromDropDown')
	//		acceptRequestFromDropDown.addProperty("xpath", ConditionType.EQUALS,
	//				"//select", true) // //p[contains(text(),'Accept Hub Installation Request')]
	//		WebUI.selectOptionByLabel(acceptRequestFromDropDown, 'Accept Installation Request', false)
	//	}

	//	@And('I click next')
	//	def selectNext() {
	//		def selectNext = new TestObject('selectNext')
	//		selectNext.addProperty("xpath", ConditionType.EQUALS, "//button[contains( text(), 'next')]", true)
	//		WebUI.click(selectNext)
	//	}

//	@And('ensure that client is moved into My Install Requests column')
//	def checkRequestStatus() {
//		def checkRequestStatus = new TestObject('checkRequestStatus')
//		checkRequestStatus.addProperty("xpath", ConditionType.EQUALS, "//*[contains( @class, 'main-body')]/div[2]//iotaa-actions-card", true)
//		WebUI.verifyElementVisible(checkRequestStatus)
//	}

	//	@And('ensure that the Hub displays activity')
	//	def ensureHubActivity() {
	//
	//	}

	/**
	 * @scenario 6:
	 * Install Tool Client Details
	 */

	// step 1 click open button

	@And('I select open')
	def clickOpenMyInstallRequests() {
		def clickOpenMyInstallRequests = new TestObject('clickOpenMyInstallRequests')
		clickOpenMyInstallRequests.addProperty("xpath", ConditionType.EQUALS,
				"(//div[contains(@class,'iotaa-card dashboard-card')])[1]//button[contains( text(), 'Open' )]", true)
		WebUI.click(clickOpenMyInstallRequests)
	}

	@And('ensure that client details are displayed on screen')
	def ensureClientDetailsDisplayed() {
		def ensureClientDetailsDisplayed = new TestObject('ensureClientDetailsDisplayed')
		ensureClientDetailsDisplayed.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains( text(), 'Client') ]", true)
		WebUI.verifyElementVisible(ensureClientDetailsDisplayed)
	}

	/**
	 * @scenario 7:
	 * Install Tool Inventory
	 */	

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	@And('ensure that a list of client devices are displayed on screen')
	def ensureListOfDevicesRequiredDisplayed() {
		def ensureListOfDevicesRequiredDisplayed = new TestObject('ensureListOfDevicesRequiredDisplayed')
		ensureListOfDevicesRequiredDisplayed.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains( text(), 'Devices Required') ]", true)
		WebUI.verifyElementVisible(ensureListOfDevicesRequiredDisplayed)
	}


	//	def ensureListOfDevicesRequiredDisplayed = new TestObject('ensureListOfDevicesRequiredDisplayed')
	//	ensureListOfDevicesRequiredDisplayed.addProperty("xpath", ConditionType.EQUALS,
	//			"//*[contains( text(), 'Devices Required') ]", true)
	//	WebUI.verifyElementVisible(ensureListOfDevicesRequiredDisplayed)

	// 0.1)
	@And('that I select the drop down')
	def selectDeviceRequiredDropDown() {
		def selectDeviceRequiredDropDown = new TestObject('selectDeviceRequiredDropDown')
		selectDeviceRequiredDropDown.addProperty("xpath", ConditionType.EQUALS,
				"//select", true)
		WebUI.selectOptionByLabel(selectDeviceRequiredDropDown, 'Begin Installation', false)
	}

	// Reuse scenario 4: I select next

	/**
	 * @scenario 3:
	 * Install Tool Install Hub
	 */

	@Given('I configure Hub')
	def configureTheHub() {

		// 1) get the hub mac address
		// --
		def getMacAddrText = new TestObject('getMacAddrText')
		getMacAddrText.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains( text(), 'First the hub')]", true)
		def theTxt = WebUI.getText(getMacAddrText)
		//println 'theTxt is : '+theTxt

		def splitTxt = theTxt.split( /\b(\w*First the hub\w*)\b/ )
		println 'splitTxt is: '+splitTxt

		def anotherSplit = splitTxt.join(', ')
		println 'anotherSplit is: ' + anotherSplit

		def anotherSplitTwo = anotherSplit.split( /\b(\w*must be installed\w*)\b\.\n\b(\w*Plug in the Hub and wait until it comes online before continuing\w*)\b/ )
		println 'anotherSplitTwo is: ' + anotherSplitTwo

		def anotherSplitThree = anotherSplitTwo.join(', ')
		def works = anotherSplitThree.substring(1)

		// replace whitespace: see https://stackoverflow.com/questions/18936452/removing-whitespace-from-strings-in-groovy
		def worksTwo = works.replaceAll("\\s","")
		println 'worksTwo is: ' + worksTwo

		// 2) add the mac address to the Hub field
		//

		def getMacAddrField = new TestObject('getMacAddrField')
		getMacAddrField.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains(@class, 'form-hubTable_row00_uuid') ]//input", true)
		WebUI.setText(getMacAddrField, worksTwo)

		// 3) set the Online field to true
		def setOnlineTrue = new TestObject('setOnlineTrue')
		setOnlineTrue.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains(@class, 'form-hubTable_row00_online') ]//input", true)
		WebUI.setText(setOnlineTrue, 'true')

		// 4) get the contents of the Last Seen field
	}


	@And('I go to PumpHouse IoT Test Tool')
	def goToPhIotTestTool() {

		// #######
		// 2 tabs open attempt

		// open the browser
		//		def anthrUtil = new anthrUtils()
		//		anthrUtil.openWebBrowser()

		// String currentPage = 'https://admin:r353tFixture@dev.cnect.to/PumpHouse/pumpAdmin/refixture'

		// int currentTab = WebUI.getWindowIndex()

		WebDriver driver = DriverFactory.getWebDriver()

		JavascriptExecutor js = ((driver) as JavascriptExecutor)

		js.executeScript('window.open();')

		WebUI.switchToWindowIndex(1)

		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL +'/PumpHouse/iotTest/')

		// ######

	}

	@And('I Iot test select client')
	def selectIotTestClient() {
		def selectIotTestClient = new TestObject('selectIotTestClient')
		selectIotTestClient.addProperty("xpath", ConditionType.EQUALS,
				"//select", true)

		WebUI.selectOptionByIndex(selectIotTestClient, 5)
	}

	@And('I select continue')
	def selectIotTestContinue() {
		def selectIotTestContinue = new TestObject('selectIotTestContinue')
		selectIotTestContinue.addProperty("xpath", ConditionType.EQUALS,
				"//input[@name='continue']", true)
		WebUI.click(selectIotTestContinue)
	}

	@And('I run a hub background event for the current time')
	def runHubBackgroundEvent() {

		// Hub
		def selectDevice = new TestObject('selectDevice')
		selectDevice.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='device_1']", true)
		WebUI.selectOptionByLabel(selectDevice, 'Hub', false)

		// Background event
		def selectEvent = new TestObject('selectEvent')
		selectEvent.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='event_1']", true)
		WebUI.selectOptionByLabel(selectEvent, 'Background event', false)

		// Time
		def setTime = new TestObject('setTime')
		setTime.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='time_1']", true)

		// Create date/time objects and set the current time into Time field
		// See https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
		def date = new Date()
		def sdf = new SimpleDateFormat("HH:mm")
		WebUI.setText(setTime, sdf.format(date) )

		// Uncheck ZWave box
		def uncheckZwave = new TestObject('uncheckZwave')
		uncheckZwave.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='zwave']", true)
		WebUI.uncheck(uncheckZwave)

		// Run the script
		def clickRun = new TestObject('clickRun')
		clickRun.addProperty("xpath", ConditionType.EQUALS,
				"//input[@value='Run']", true)
		WebUI.click(clickRun)

		// CLose the the IoT test window
		WebUI.closeWindowIndex(1)

		// navigate back to installer dashboard
		WebUI.switchToWindowIndex(0)
	}

	@Then('ensure that the Hub displays activity')
	def ensureHubDisplaysActivity() {
		// check the last seen field dosnt have N/A
		def lastSeen = new TestObject('lastSeen')
		lastSeen.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains(@class, 'hubTable_row00_lastSeen') ]//input", true)
		def lastSeenTxt = WebUI.getText(lastSeen)

		// Progress to the Install Devices screen
		if(lastSeenTxt != 'N/A') {
			def selectNext = new TestObject('selectNext')
			selectNext.addProperty("xpath", ConditionType.EQUALS, "//button[contains( text(), 'next')]", true)
			WebUI.click(selectNext)
		}
	}

	/**
	 * @scenario 8:
	 * Install Tool Device Selection
	 */
	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	// And I select the device dropdown
	@And('I select the device dropdown')
	def selectDevice() {
		def selectDevice = new TestObject('selectDevice')
		selectDevice.addProperty("xpath", ConditionType.EQUALS,
				"//select", true)
		WebUI.click(selectDevice)
	}

	@And('I select Bathroom PIR')
	def selectBathroomPir() {
		def selectBathroomPir = new TestObject('selectBathroomPir')
		selectBathroomPir.addProperty("xpath", ConditionType.EQUALS,
				"//select", true)
		WebUI.selectOptionByLabel(selectBathroomPir, 'Bathroom (Fibaro.PIR)', false)
	}

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	//######################################//
	//## Reuse PumpHouse IoT Test Tool code
	//	And I go to PumpHouse IoT Test Tool
	//	And I Iot test select client
	//	And I select continue
	//######################################//

	@And('I run a bathroroom motion sensor event for the current time')
	def runBathroomPirEvent() {

		// Bathroom
		def selectDevice = new TestObject('selectDevice')
		selectDevice.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='device_1']", true)
		WebUI.selectOptionByLabel(selectDevice, 'Bathroom', false)

		// Motion Sensor movement on
		def selectEvent = new TestObject('selectEvent')
		selectEvent.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='event_1']", true)
		WebUI.selectOptionByLabel(selectEvent, 'Motion Sensor movement on', false)

		// Time
		def setTime = new TestObject('setTime')
		setTime.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='time_1']", true)

		// Create date/time objects and set the current time into Time field
		// See https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
		def date = new Date()
		def sdf = new SimpleDateFormat("HH:mm")
		WebUI.setText(setTime, sdf.format(date) )

		// Uncheck ZWave box
		def uncheckZwave = new TestObject('uncheckZwave')
		uncheckZwave.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='zwave']", true)
		WebUI.uncheck(uncheckZwave)

		// Run the script
		def clickRun = new TestObject('clickRun')
		clickRun.addProperty("xpath", ConditionType.EQUALS,
				"//input[@value='Run']", true)
		WebUI.click(clickRun)

		WebUI.closeWindowIndex(1)

		WebUI.switchToWindowIndex(0)
	}

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	@And('I select Test Device')
	def selectTestDevice() {
		def selectTestDevice = new TestObject('selecTestDevice')
		selectTestDevice.addProperty("xpath", ConditionType.EQUALS,
				"//select", true)

		//		if( WebUI.getText(selectTestDevice) == 'Test Device' ) {
		//			WebUI.selectOptionByLabel(selectTestDevice, 'Test Device', false)
		//		} else {
		//			println ' ** DEVICE IS ALREADY INSTALLED ** '
		//			WebUI.selectOptionByLabel(selectTestDevice, 'Test Device', false, FailureHandling.STOP_ON_FAILURE)
		//		}

		//select//*[contains(text(), 'Test Device')]

		WebUI.selectOptionByLabel(selectTestDevice, 'Test Device', false)


	}

	//######################################//
	//## Reuse scenario 4: I select next ###//
	//######################################//

	//######################################//
	//## Reuse PumpHouse IoT Test Tool code
	//	And I go to PumpHouse IoT Test Tool
	//	And I Iot test select client
	//	And I select continue
	//######################################//

	@And('I test bathroom PIR')
	def testBathroomPir() {
		// Bathroom
		def selectDevice = new TestObject('selectDevice')
		selectDevice.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='device_1']", true)
		WebUI.selectOptionByLabel(selectDevice, 'Bathroom', false)

		// Motion Sensor movement on
		def selectEvent = new TestObject('selectEvent')
		selectEvent.addProperty("xpath", ConditionType.EQUALS,
				"//select[@id='event_1']", true)
		WebUI.selectOptionByLabel(selectEvent, 'Motion Sensor movement on', false)

		// Time
		def setTime = new TestObject('setTime')
		setTime.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='time_1']", true)

		// Create date/time objects and set the current time into Time field
		// See https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
		def date = new Date()
		def sdf = new SimpleDateFormat("HH:mm")
		WebUI.setText(setTime, sdf.format(date) )

		// Uncheck ZWave box
		def uncheckZwave = new TestObject('uncheckZwave')
		uncheckZwave.addProperty("xpath", ConditionType.EQUALS,
				"//input[@id='zwave']", true)
		WebUI.uncheck(uncheckZwave)

		// Run the script
		def clickRun = new TestObject('clickRun')
		clickRun.addProperty("xpath", ConditionType.EQUALS,
				"//input[@value='Run']", true)
		WebUI.click(clickRun)

		WebUI.closeWindowIndex(1)

		WebUI.switchToWindowIndex(0)

		// check the last seen field dosnt have N/A
		def lastSeen = new TestObject('lastSeen')
		lastSeen.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains(@class, 'scrollx') ]/div/div[2]/div[contains(@class, 'td') ][8]//input", true)
		def lastSeenTxt = WebUI.getText(lastSeen)

		println '// test device > last seen field is: ---->>>' + lastSeenTxt

		// Progress to the Install Devices screen
		if(lastSeenTxt != '-') {
			def selectNext = new TestObject('selectNext')
			selectNext.addProperty("xpath", ConditionType.EQUALS, "//button[contains( text(), 'next')]", true)
			WebUI.click(selectNext)
		}
	}

	@Then('I confirm the device has been tested')
	def confirmDeviceIsTested() {
		def confirmDeviceIsTested = new TestObject('confirmDeviceIsTested')
		confirmDeviceIsTested.addProperty("xpath", ConditionType.EQUALS,
				"//*[contains(@class, 'scrollx') ]/div/div[2]/div[contains(@class, 'td') ][5]//*[contains( text(), 'tested')]", true)

	}

	//






	// ######################################################################

	/**
	 * @scenario 10:
	 * Close browser
	 */
	@Then('close the browser')
	def closeBrowser() {
		WebUI.closeBrowser()
	}




}