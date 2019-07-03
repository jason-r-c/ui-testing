package iotaaDashboardUtils

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
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.ObjectRepository
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords
import com.sun.org.apache.xml.internal.serializer.utils.Utils

//import internal.GlobalVariable

import MobileBuiltInKeywords as Mobile
import WSBuiltInKeywords as WS
import WebUiBuiltInKeywords as WebUI

// ## JCARNEY custom imports

// Import class so we can access IS_OS_MAC and IS_OS_WINDOWS
import org.apache.commons.lang.SystemUtils as systemUtils
import org.junit.After

// Date library
import java.text.SimpleDateFormat as SimpleDateFormat

// RunConfiguration: used for getting the path to the project directory
import com.kms.katalon.core.configuration.RunConfiguration as RunConfiguration

// Packages for getting the browser name and using native selenium commands
import com.kms.katalon.core.webui.driver.DriverFactory as DF
import com.thoughtworks.selenium.webdriven.WebDriverBackedSelenium

// Use assertion library: useful to stopping tests when things dont work out.
import org.testng.Assert as Assert

// @JC 13/3/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// Import
import internal.GlobalVariable

/**
 *
 * @author jasoncarney
 *
 * A collection of common methods that will be used by most Test Cases.
 * Test Cases can be customised by passing in the relevant arguments.
 *
 */

public class Utilities {

	/**
	 * Open the web browser and maximise to the size of the screen.
	 */
	@Keyword
	def openWebBrowser() {
		WebUI.openBrowser('')
		WebUI.maximizeWindow()
	}

	/**
	 * !!DEPRECATED!! Do not use!!
	 */
	@Keyword
	def xpathToLowerCase() {
		def translateXpath = "translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),"
		return translateXpath
	}

	/**
	 * @xpathToLower wraps the innards of using translate() and enables other classes to use easily.
	 * @return string
	 */	
	@Keyword
	def xpathToLower(String item) {
		def lower = "[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'"+item+"') ]"
		return lower
	}

	/**
	 * @xpathToLowerConditionalStatement wraps the innards of using translate() and enables other classes to use easily. 
	 * - Useful for using with xpath AND / OR
	 * @return string
	 */
	@Keyword
	def xpathToLowerConditionalStatement(String item) {
		def lower = "contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'"+item+"')"
		return lower
	}


	/**
	 * Check which OS we are on and return the url fragment.
	 *
	 * Mac is typically used for local development	
	 * Linux is used for running tests in the Acceptance Test (AT) environment.
	 * Windows is not currently used for running tests.
	 *
	 * @return the url fragment (dev or at) used for determining which environment to run on.
	 */
	@Keyword
	def checkOS() {
		// NOTE: You must declare the variable at the top of the method in order to access it
		def env

		// Set the environment to dev.cnect.to for Mac or at.cnect.to for Linux / Windows
		if(systemUtils.IS_OS_MAC) {

			// NOTE: Dont add def or String to variable, so we can access outside of block scope
			// http://mrhaki.blogspot.co.uk/2009/11/groovy-goodness-variable-scope-in.html
			env = "dev"
			println 'the OS is Mac and the env is: ' + env
		}

		if(systemUtils.IS_OS_WINDOWS) {
			env = 'iotaa-test'
			println 'the OS Windows and the env is: ' + env
		}

		//		else if(systemUtils.IS_OS_WINDOWS || systemUtils.IS_OS_LINUX) {
		//			env = "at"
		//			println 'the OS is Windows or Liunx and the env is: ' + env
		//		}

		return env
	}

	/**
	 * Save the IoTAA fixture, clear the database and run the SetupDemoScript.
	 * 
	 * @JC 2019-02-19: this function needs to be refactored as we are now targeting new environments.
	 * 
	 * - https://at.aws.anthropos.io/iotaa (integration)
	 * - https://homeinstead.cnect.to/iotaa (live)
	 * - https://iotaa-test.anthropos.io (UAT)
	 */
	@Keyword
	def saveIotaaFixture() {
		// Check which environment we are in, and store a reference specific to the environment
		def env = checkOS()

		// Access the refixture page in PumpAdmin
		WebUI.navigateToUrl('https://admin:r353tFixture@' + env + '.cnect.to/PumpHouse/pumpAdmin/refixture')

		// @JC 17/05/18: pseudo code to defend  against 'Service Unavailable' screen when AT goes down
		// TODO: create an object in OR that looks for the "Save Fixture" link
		// def canWeSeeSaveFixture = WebUI.waitForElementVisible(findTestObject("IoTAA_PumpAdmin/a_Save Fixture"), 8, FailureHandling.STOP_ON_FAILURE)

		/**
		 * Meta
		 * -----
		 * See issue: https://iotaa.manuscript.com/f/cases/116/
		 * Note: Not yet tested!!
		 *
		 * pseudo code
		 * ------------
		 * 23/05/18:
		 * try to login, if not possible, check if
		 * - <h1>HTTP Status 404 - /PumpHouse/iotaa</h1>
		 * 		or
		 * - Service Unavailable
		 * has been displayed on screen, if thats the case, stop the test
		 */
		/*
		 def isSaveFixtureDisplayed = WebUI.waitForElementVisible(findTestObject('IoTAA_PumpAdmin/a_Save Fixture'), 32)
		 if( isSaveFixtureDisplayed == false ) {
		 println "isSaveFixtureDisplayed is false"
		 if( WebUI.verifyTextPresent("HTTP Status 404", false) == true || WebUI.verifyTextPresent("Service Unavailable", false) == true) {
		 println "PH is down :("
		 }
		 }
		 */

		// Click on the Save fixture in PumpAdmin
		WebUI.click(findTestObject('IoTAA_PumpAdmin/a_Save Fixture'))

		// Select iotaa from the drop down list
		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/select_BetterTogetherBetterTog'), 'Iotaa', false)

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
		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), 'com.pumpco.iotaa.SetupDemoScript', false)

		// Click the Run button to execute the SetupDemoScript
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

		// Verify setup demo script has ran
		WebUI.verifyTextPresent('executed script com.pumpco.iotaa.SetupDemoScript', false)
	}

	/**
	 *
	 * @param customScript - The name of the script we want to run. This is specific to each Test Case.
	 */
	@Keyword
	def runCustomScenario(String customScript) {
		//def env = checkOS()

		// Navigate to the Scripts page in PumpAdmin
		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL +'/PumpHouse/pumpAdmin/scripts')

		// Select AttendanceInScript from the drop down list
		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), customScript,
				false)

		// Click the Run button to execute the AttendanceInScript script
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query (1)'))
	}

	/**
	 * Login to the IoTAA dashboard as the user we specify.
	 *
	 * @param username - The user we are logging in as
	 * @param password - The users password
	 * @param findElement - The HTML element to find in the web page
	 */
	@Keyword
	def loginIotaaDashboard(String username, String password, String findElement) {
		// The element wont be visible at first
		def didWeLogin = WebUI.waitForElementVisible(findTestObject(findElement), 16)
		println "didWeLogin is: " + didWeLogin

		// If we didnt get past the login page then try to login again
		def i = 0
		while ( {
			// If we havnt logged in three times, then stop the test
			if( i == 3 ) {
				println "counter should be 3 - it is: " + i

				// @JC 25/06/18: assertion never seems to fire, and stop the tests. falling back to a console message
				// and return
				// assert WebUI.waitForElementVisible(findTestObject(findElement), 16, FailureHandling.STOP_ON_FAILURE)

				println "## ALERT: Tried logging in 3 times. The test should now stop as a true assertion will fail. ##"
				println "didWeLogin is: " + didWeLogin
				Assert.assertTrue( didWeLogin )
			}

			println "didWeLogin is false and have entered the while loop"

			// Refresh the current web page
			WebUI.refresh()

			// Wait a while before proceeding
			WebUI.delay(6)

			// Type in the iotaa username
			WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2'), username)

			// Type in the users password
			WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2_1'), password)

			// Click the remember radio button
			// WebUI.click(findTestObject('IoTAA_Common_Items/LoginPage_RememberMeRadioBtn'))

			// Sign in to the dashboard
			WebUI.click(findTestObject('IoTAA_Common_Items/button_sign in'))

			didWeLogin = WebUI.waitForElementVisible(findTestObject(findElement), 16)

			println "didWeLogin at end of while loop is: " + didWeLogin

			i++

			println "counter i is: " + i

			didWeLogin == false
		} () ) continue

			println "Exited while loop. didWeLogin should be true - it is: " + didWeLogin

		// Wait a while before proceeding
		WebUI.delay(6)
		WebUI.waitForElementPresent(findTestObject(findElement), 32)
	}



	/**
	 * Take a screenshot. The screenshot will the used to compare against.
	 */
	@Keyword
	def takeYesterdaysScreenshot() {

		WebUI.takeScreenshot( RunConfiguration.getProjectDir() + '/screenshots/previous.png' )

		/* Legacy code */	

		// Take screenshot after logging in
		// resource: https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
		// def today = new Date()

		// take away one date from today
		// resource: https://stackoverflow.com/questions/8816990/subtract-a-date-by-1-or-2-in-groovy
		// def yesterday = today - 1

		//println yesterday.format("dd-MM-yyyy")
		//def sdf = new SimpleDateFormat('dd-MM-yyyy') // to add hours, mins, secs - HH-mm-ss

		//println sdf.format(today)
		//println('\n')

		//println(((('Yesterdays date was: ' + RunConfiguration.getProjectDir()) + '/screenshots/sc_') + yesterday.format('dd-MM-yyyy')) +
		//'.png \n')

		//println(((('Todays date is: ' + RunConfiguration.getProjectDir()) + '/screenshots/sc_') + sdf.format(today)) + '.png \n')

		//println(('The current project folder is: ' + RunConfiguration.getProjectDir()) + '\n')

		// Take a screenshot
		// WebUI.takeScreenshot(((RunConfiguration.getProjectDir() + '/screenshots/sc_') + yesterday.format('dd-MM-yyyy')) + '.png')
	}

	/**
	 * Clicks on a button. The button clicked depends on the name passed into the method.
	 * 
	 * @param thevar: The text displayed on a button. 
	 * @return NULL
	 */	
	@Keyword
	def clickSidebarNavButton(String thevar) {
		def sidebarButton = new TestObject("sidebarButton")
		def button = "//*[contains(@class,'sidebar-menu')]//button[contains(text(),'" + thevar + "')]"
		sidebarButton.addProperty("xpath", ConditionType.EQUALS, button, true)
		WebUI.click(sidebarButton)
	}

	//	/**
	//	 * #########################
	//	 * Gherkin Glue Code
	//	 * ########################
	//	 */
	//	//
	//	//	@When(/^.*click drop down list.*$/)
	//	//	def clickDropDownList() {
	//	//		//		def dropDown = new TestObject('dropDown')
	//	//		//		dropDown.addProperty("xpath", ConditionType.EQUALS,
	//	//		//				"//*[contains( @class, 'toggle-mobile' )]//*[contains( text(), 'Login') ]", true)
	//	//		//		WebUI.click(dropDown)
	//	//
	//	//		WebUI.openBrowser('https://news.sky.com')
	//	//		WebUI.closeBrowser()
	//	//	}
	//
	//	// ## Scenario: Save Iotaa fixture ## //
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: click next. Description: Clicks the next link that is displayed within an AppFLow.
	//	 */
	//	@And(/^.*click next.*$/)
	//	def clickNext() {
	//		def selectNext = new TestObject('selectNext')
	//		selectNext.addProperty("xpath", ConditionType.EQUALS, "//button[contains( text(), 'next')]", true)
	//		WebUI.click(selectNext)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin: Step: go to PumpAdmin fixtures list. Description: Navigates to PumpAdmin fixture list.
	//	 */
	//	@Given(/^.*go to PumpAdmin fixtures list.*$/)
	//	def goToPumpAdminFixtureList() {
	//		// open the browser
	//		openWebBrowser()
	//
	//		// go to pumpadmin
	//		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/pumpAdmin/refixture')
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin: Step: select(.*)fixture. Description: Select a fixture to save, more than likely this will be Iotaa. '(.*)' represents any value from the drop down list.
	//	 */
	//	@And(/^.*select(.*)fixture.*$/)
	//	def selectFixture(String fixture) {
	//		if(!fixture || fixture == " ") {
	//			fixture = "Iotaa"
	//		}
	//		fixture = fixture.trim()
	//		// println "fixture is:"+fixture
	//
	//		// Select iotaa from the drop down list
	//		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/select_BetterTogetherBetterTog'), fixture, false)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin: Step: drop the database. Description: Resets the database to its default state.
	//	 */
	//	@And(/^.*drop the database.*$/)
	//	def dropDb() {
	//		// Click the Drop Database radio button
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))
	//
	//		// Click submit
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin: Step: confirm the password. Description: Adds the password for refixturing.
	//	 */
	//	@And(/^.*confirm the password.*$/)
	//	def confirmFixtureSavePassword() {
	//		// Type password
	//		WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin: Step: click submit to refixture. Description: Runs the refixture in PumpHouse
	//	 */
	//	@Then(/^.*click submit to refixture.*$/)
	//	def runRefixture() {
	//		// Click the Submit button to save the fixture
	//		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	//
	//		// Verify the iotaa fixture has been saved
	//		WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 10)
	//	}
}
