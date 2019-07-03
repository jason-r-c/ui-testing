package iotaaDashboardUtils

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.util.KeywordUtil
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

// @JC 13/3/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When


// @JC 21/3/19:
import iotaaDashboardUtils.Utilities as anthrUtils

// 26/3/19: debug output
import groovy.json.JsonOutput

// JC 2/5/19: updated to use new reusableGludeCode package name
// import iotaaDashboardUtils.appflows as anthrAppflows
import reusableGlueCode.appflows as anthrAppflows

// JCARNEY 6/6/19
import com.kms.katalon.core.exception.StepErrorException as StepErrorException


public class glueCode {

	def anthrUtils = new anthrUtils()
	def anthrAppflows = new anthrAppflows()

	/***************************************************************************************************************
	 * Desktop dashboard > utilities
	 ***************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: click on sidebar (.*) button. Description: Clicks on the desired button in the sidebar
	 */
	@And('click on sidebar (.*) button')
	def click_on_sidebar_x_button(String buttonName) {
		def xpathQuery = ''
		def clickOnSidebarXButton = new TestObject("clickOnSidebarXButton")
		xpathQuery = "//body//*[contains(@name, 'Iotaa.anthroposSupportLandingPageLeftCog')]//button[contains( text(),'" + buttonName + "') ]"
		clickOnSidebarXButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickOnSidebarXButton)
	}

	/**
	 * !! DEPRECATED !!
	 * 
	 * @anthropos-gherkin:
	 * _Step_: click on (.*) tile. Description: Clicks on the desired cog tile (such as Admin in the Head Office dashboard), so to enter the cog application. <br><br><strong>Example usage:</strong><br>click on Admin tile
	 */
	@And('click on (.*) tile')
	def click_on_x_tile(String tileName) {
		def xpathQuery = ''
		def clickOnXTile = new TestObject("clickOnXTile")
		xpathQuery = "//body//*[contains(@name, 'System.HomeSpace')]/div[@name='" + tileName + "']"
		clickOnXTile.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickOnXTile)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: click the tile entitled (.*). Description: Clicks on the desired cog tile (such as Admin in the Head Office dashboard), so to enter the cog application. <br><br><strong>Example usage:</strong><br>click the tile named Admin
	 */
	@And('click the tile entitled (.*)')
	def click_the_tile_named_x(String tileName) {
		def xpathQuery = ''
		def clickOnXTile = new TestObject("clickOnXTile")
		xpathQuery = "//*[contains(@name, 'app')]//p[1][contains(text(), '"+tileName+"')]"
		clickOnXTile.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickOnXTile)
	}

	//
	/**
	 * @anthropos-gherkin:
	 * Step: click back in header console to head back to dashboard home screen. Description: Clicks on the back button in the header console so to navigate back to the dashboard home screen
	 */
	@And('click back in header console to head back to dashboard home screen')
	def click_back_in_header_console_to_head_back_to_dashboard_home_screen() {
		def xpathQuery = xpathGenerator('headerBackBtn')
		def headerConsoleBackButton = new TestObject("headerConsoleBackButton")
		headerConsoleBackButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		// @JC 13/6/19: working on https://iotaa.manuscript.com/f/cases/3390/

		// WebUI.waitForElementVisible(headerConsoleBackButton, 5)
		// WebUI.click(headerConsoleBackButton)

		try {

			assert WebUI.waitForElementVisible(headerConsoleBackButton, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)
			WebUI.click(headerConsoleBackButton)

		} catch (AssertionError e) {

			println e.getMessage()
			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")
			return false

		}
	}

	// JC 10/5/19
	/**
	 * @anthropos-gherkin:
	 * Step: click More Actions menu. Description: Use this step for clicking the '3 dots' displayed in the header console, which displays menu items in a sliding panel.
	 */
	@And('click More Actions menu')
	def click_more_actions_menu() {
		// def xpathQuery = "//div[contains(@class,'header-more')]"
		def xpathQuery = xpathGenerator('moreActionsMenu')
		println '\r click_more_actions_menu > xpathQuery is: '+xpathQuery
		def moreActionsButtonElement = new TestObject("moreActionsButtonElement")
		moreActionsButtonElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		// @JC 13/6/19: working on https://iotaa.manuscript.com/f/cases/3390/

		// WebUI.waitForElementVisible(moreActionsButtonElement, GlobalVariable.G_Timeout)
		// WebUI.click(moreActionsButtonElement)

		// Check we can click on the 3 dots
		try {

			assert WebUI.waitForElementVisible(moreActionsButtonElement, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)
			WebUI.click(moreActionsButtonElement)

		} catch (AssertionError e) {

			println e.getMessage()
			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")

		}

		// Check we can see the menu panel
		try {

			xpathQuery = "//*[contains(@class,'menu-dropdown') and contains(@class,'displayed') ]"
			def panel = new TestObject("panel")
			panel.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

			assert WebUI.waitForElementVisible(panel, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)

		} catch (AssertionError e) {

			println e.getMessage()
			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")

		}


	}

	// ################################################################################
	// # BEGIN: Unit testing 24/6/19
	// ################################################################################

	/**
	 * isValidXpathQuery()
	 * 
	 * @param xpathQuery - A string containing an xpath query 
	 * @return The supplied xpath query confirmed as a type String
	 */
	def isValidXpathQuery(String xpathQuery) {
		def isString = xpathQuery instanceof String
		if(isString == true) {
			return xpathQuery
		}
	}

	/**
	 * createTestObject()
	 * 
	 * @param objName - The object ID
	 * @return An instantiated Test object
	 */
	def createTestObject(String objName) {
		def obj = new TestObject(objName)
		if(obj instanceof TestObject) {
			return obj
		}
	}

	/**
	 * Add property to test object
	 */
	def xpathPropertyAddedToTestObject(Object obj, String xpathQuery) {
		println '\r obj is: '+obj
		obj.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		return obj
	}


	/**
	 * @anthropos-gherkin:
	 * Step: signout of application. Description: Use this step for clicking 'signout' (which is present in the More Actions menu). This will log the user out of the dashboard / family app.  
	 */
	@And('signout of application')
	def signout_of_application() {
		// def xpathQuery = isValidXpathQuery("//div[contains(@class,'header-more')]//button[contains(text(), 'signout')]")

		def xpathQuery = xpathGenerator('signoutBtn')
		println '\r xpathQuery is:'+xpathQuery

		def signOutButtonElement = createTestObject("signOutButtonElement")

		//println '\r signOutButtonElement is: '+signOutButtonElement.getClass()+'\r'

		// @JC 25/6/19: pass object to assertXpathPropertyAddedToTestObject()
		// signOutButtonElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		signOutButtonElement = xpathPropertyAddedToTestObject(signOutButtonElement, xpathQuery)
		println '\r returned testObject is: '+signOutButtonElement

		def stringifiedObject =  JsonOutput.toJson(signOutButtonElement)
		println '\r signOutButtonElement prettified is: '+signOutButtonElement+'\r'
		println JsonOutput.prettyPrint(stringifiedObject)

		// @JC 13/6/19: working on https://iotaa.manuscript.com/f/cases/3390/

		// WebUI.waitForElementVisible(signOutButtonElement, GlobalVariable.G_Timeout)
		// WebUI.click(signOutButtonElement)

		// Check we can see the menu panel
		try {

			// xpathQuery = "//*[contains(@class,'menu-dropdown') and contains(@class,'displayed') ]"
			xpathQuery = xpathGenerator('mainMenuPanel')
			def panel = new TestObject("panel")
			panel.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

			assert WebUI.waitForElementVisible(panel, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)

			WebUI.click(signOutButtonElement)

		} catch (AssertionError e) {

			println e.getMessage()
			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")

		}

		// Confirm we are on the login screen
		try {
			// xpathQuery = "//*[contains(text(),'please enter your credentials')]"
			xpathQuery = xpathGenerator('loginScreen')
			def signInScreen = new TestObject("signInScreen")
			signInScreen.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

			// assert WebUI.waitForElementVisible(signInScreen, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)

			def isVisible = WebUI.waitForElementVisible(signInScreen, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)

			if(isVisible == true) {
				return true
			} else {
				return false
			}

		} catch (AssertionError e) {
			println e.getMessage()
			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")
		}

	}


	def xpathGenerator(xpathKey) {
		def xpathCollection = [
			signoutBtn: "//div[contains(@class,'header-more')]//button[@value='signout']",
			mainMenuPanel: "//*[contains(@class,'menu-dropdown') and contains(@class,'displayed') ]",
			loginScreen: "//*[contains(text(),'please enter your credentials')]",
			headerConsole: "//body/*[@id='header']",
			headerBackBtn: "//body/div[@id='header']//button[@name='back']",
			moreActionsMenu: "//div[contains(@class,'header-more')]",
			selectPumpAdminScript: '//form[@action="/PumpHouse/pumpAdmin/runScript"]//select',
			localOfficeLogo: "//*[contains(@class, 'branding-logo')]",
			headerConsoleContactsShortcut: "//body/*[@id='header']//*[contains(@class,'ico-contacts')]",
			headerConsoleNotificationsShortcut: "//body/*[@id='header']//*[@class='header-shortcuts-notifications']//*[contains(@class,'ico-flags')]",
			headerConsoleSettingsShortcut: "//body/*[@id='header']//*[@class='header-shortcuts-settings']//*[contains(@class,'ico-settings')]",
			headerConsoleInfoHelpShortcut: "//body/*[@id='header']//*[@class='header-shortcuts-help']//*[contains(@class,'ico-info')]",
			installationTableManageBtn: "//*[@data-ui-test='aos.component.csvtable']//*[@data-ui-test='aos.action.link']"
		]

		if(xpathCollection.get(xpathKey)){
			return xpathCollection.get(xpathKey)
		} else {
			return false
		}
	}

	// ################################################################################
	// # END: Unit testing 24/6/19
	// ################################################################################

	/***************************************************************************************************************
	 * Low level Gherkin: Save fixture 
	 ***************************************************************************************************************/

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I go to PumpAdmin fixtures list. Description: Navigates to PumpAdmin fixture list.
	 */
	@Given("I go to PumpAdmin fixtures list")
	def goToPumpAdminFixtureList() {
		// open the browser
		anthrUtils.openWebBrowser()

		// go to pumpadmin
		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/pumpAdmin/refixture')
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: select (.*) fixture. Description: Select a fixture to save, more than likely this will be Iotaa. '(.*)' represents any value from the drop down list.
	 * 
	 * Pre defined values
	 * - Iotaa
	 * - HealthPump
	 * - System
	 * - SystemTest
	 */
	@And("I select (.*) fixture")
	def selectFixture(String fixture) {
		if(!fixture || fixture == " ") {
			fixture = "Iotaa"
		}
		fixture = fixture.trim()
		// println "fixture is:"+fixture

		// Select iotaa from the drop down list
		WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/select_BetterTogetherBetterTog'), fixture, false)
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: drop the database. Description: Resets the database to its default state.
	 */
	@And("I drop the database")
	def dropDb() {
		// Click the Drop Database radio button
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))

		// Click submit
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: confirm the password. Description: Adds the password for refixturing.
	 */
	@And("I confirm the password")
	def confirmFixtureSavePassword() {
		// Type password
		WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: click submit to refixture. Description: Runs the refixture in PumpHouse
	 */
	@Then("I click submit to refixture")
	def runRefixture() {
		// Click the Submit button to save the fixture
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

		// Verify the iotaa fixture has been saved
		WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 10)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step_: I go to PumpAdmin fixtures list. Description: Navigates to PumpAdmin fixture list.
	 */
	@Given("Head back fixtures list")
	def headBackToFixturesList() {
		WebUI.back()
	}

	/**************************************************************************************************************
	 * Low level Gherkin: Run PumpAdmin script
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I navigate to PumpAdmin Scripts list. Description: Navigates to the scripts page in pumpAdmin
	 */
	@Given("I navigate to PumpAdmin Scripts list")
	def goToPumpAdmin() {
		// open the browser
		anthrUtils.openWebBrowser()

		// go to pumpadmin
		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/pumpAdmin/scripts')
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I select (.*) script. Description: Selects a script from the select list
	 */
	@And("I select (.*) script")
	def setupDemoScript(String scriptToRun) {
		// Select SetupDemoScript from the drop down list
		// WebUI.selectOptionByValue(findTestObject('IoTAA_PumpAdmin/SelectSetupDemoScript'), scriptToRun, false)

		def xpathQuery = xpathGenerator('selectPumpAdminScript')

		def selectScript = new TestObject('selectScript')
		selectScript.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		WebUI.selectOptionByValue(selectScript, scriptToRun, false)
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I click the run button. Description: Clicks the run button and executes the selected script
	 */
	@And("I click the run button")
	def runSetupDemoScript() {
		// Click the Run button to execute the SetupDemoScript
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	}

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I ensure that the AppFlow status is complete. Description: Ensures that the script has ran successfully
	 */
	@Then("I ensure that the AppFlow status is complete")
	def setupDemoScriptComplete() {
		// Verify setup demo script has ran
		WebUI.verifyTextPresent('executed script', false)
	}

	/**************************************************************************************************************
	 * High level Gherkin: Refixture and  Run PumpAdmin script
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: Normalise the dashboard. Description: ** Development tool only: Useful for removing data during development of features. ** <br><br> Resets the application to its default state for the specified environment, ie, no data displayed in the dashboards / family app
	 */
	@Given("Normalise the dashboard")
	def normaliseDashboard() {
		// Save the Iotaa fixture as thats the webapp we want
		goToPumpAdminFixtureList()
		selectFixture('Iotaa')
		dropDb()
		confirmFixtureSavePassword()
		runRefixture()

		// Run the initial iotaa setup script so we can use the dashboards
		goToPumpAdmin()
		setupDemoScript('com.pumpco.iotaa.SetupDemoScript')
		runSetupDemoScript()
		setupDemoScriptComplete()
	}

	/**
	 * JCARNEY 28/06/19: Marked for deletion.
	 * Having searched for the gherkin step, it appears in the archived feature 
	 * - repository/visual-regression-testing/iotaa-project/Include/features/Archived_features/dataGeneration.feature
	 * 
	 * And as an un-documented glue code function in
	 * - repository/visual-regression-testing/iotaa-project/Keywords/iotaaDashboardUtils/glueCode.groovy
	 * 
	 * @anthropos-gherkin:
	 * _Step_: Create Local Office data. Description: Creates dummy data that populates the dashboard 
	 */
	@Given('Create Local Office data')
	def createLocalOfficeData() {

		def xpathQuery = ''
		def selectClient = ''

		// Alerts card
		//		goToPumpAdmin()
		//		setupDemoScript('com.pumpco.iotaa.WanderingAtNightScript')
		//		runSetupDemoScript()
		//		setupDemoScriptComplete()

		// Notifications
		// 1) Navigate to the head office
		fullLoginProcess('Head Office', 'admin.iotaa', 'onetwothree')

		// 2) click on apps sidebar button
		def clickSidebarAppsBtn = new TestObject("clickSidebarAppsBtn")
		xpathQuery = "//body//*[contains(@name, 'Iotaa.anthroposSupportLandingPageLeftCog')]//button[text()='Apps']"
		clickSidebarAppsBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickSidebarAppsBtn)

		// 3) click on admin tile
		def clickAdminCog = new TestObject("clickAdminCog")
		xpathQuery = "//body//*[contains(@name, 'System.HomeSpace')]//*[@name='Iotaa.adminNav']"
		clickAdminCog.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickAdminCog)

		// 4) select manage alerts and insights
		def selectNanageAlertsAndInsights = new TestObject("selectNanageAlertsAndInsights")
		xpathQuery = "//*[contains(text(),'Admin tasks')]/ancestor::div/following-sibling::div[2]//select"
		selectNanageAlertsAndInsights.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectNanageAlertsAndInsights, 'Manage Alerts & Insights', false)

		// 5) click next
		anthrAppflows.selectNextAppflow('Admin tasks')

		// 6) select bristol
		def selectOffice = new TestObject("selectOffice")
		xpathQuery = "//*[contains(text(),'Select Local Office')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'Bristol') ]"
		selectOffice.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectOffice)

		// 7) click next
		anthrAppflows.selectNextAppflow('Select Local Office')

		// 8) select john jenkins
		// NOTE: the xpath should form a function that serves a select list (orange backed item)
		selectClient = new TestObject("selectClient")
		xpathQuery = "//*[contains(text(),'Client')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'John') ]"
		selectClient.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectClient)

		// 9) click next
		anthrAppflows.selectNextAppflow('Client')

		// 10) Alerts during office hours => select family app
		def selectAlertAndInsightRecipients_alertsDuring = new TestObject("selectAlertAndInsightRecipients_alertsDuring")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[1]"
		selectAlertAndInsightRecipients_alertsDuring.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsDuring, 'Family App', false)

		// 11) Alerts out of office hours => select family app
		def selectAlertAndInsightRecipients_alertsOut = new TestObject("selectAlertAndInsightRecipients_alertsOut")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[2]"
		selectAlertAndInsightRecipients_alertsOut.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsOut, 'Office Dashboard', false)

		// 12) Actionable Insights => select family app
		def selectAlertAndInsightRecipients_AIs = new TestObject("selectAlertAndInsightRecipients_AIs")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[3]"
		selectAlertAndInsightRecipients_AIs.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_AIs, 'Office Dashboard', false)


		// 13) click next
		anthrAppflows.selectNextAppflow('Select Alert & Insight recipients')


		// 14) Who to escalate to => select Other
		def escalateToOfficeHours = new TestObject("escalateToOfficeHours")
		xpathQuery = "//body//*[text()='How to deal with alerts not acknowledged on the Family App']/ancestor::div[1]/following-sibling::div[2]//div[2]//select"
		escalateToOfficeHours.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(escalateToOfficeHours, 'Other', false)

		// --

		// 15) click next
		anthrAppflows.selectNextAppflow('How to deal with alerts not acknowledged on the Family App')

		// JC: 24/4/19: works during office hours, ie, 8am-6pm
		// 15.1)
		def a = new TestObject("a")
		xpathQuery = "//span[@class='phone-number']/input[1]"
		a.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		def phonePortionOne = '12345'
		WebUI.setText(a, phonePortionOne)

		// 15.2)
		def b = new TestObject("b")
		xpathQuery = "//span[@class='phone-number']/input[2]"
		b.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		def phonePortionTwo = '618910'
		WebUI.setText(b, phonePortionOne)

		// 15.3)
		anthrAppflows.selectNextAppflow('Please specify contact details for alert escalation during office hours')


		//			// 16) (again) Who to escalate to => select Other
		//			def escalateToOutOfOfficeHours = new TestObject("escalateToOutOfOfficeHours")
		//			xpathQuery = "//body//*[text()='How to deal with alerts not acknowledged on the Family App']/ancestor::div[1]/following-sibling::div[2]//div[2]//select"
		//			escalateToOutOfOfficeHours.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		//			WebUI.selectOptionByLabel(escalateToOutOfOfficeHours, 'Other', false)
		//
		//			// 17) click next
		//			selectNextAppflow('How to deal with alerts not acknowledged on the Family App')


		// 18) click next
		anthrAppflows.selectNextAppflow('Notification methods')


		// 19) click finish
		def finishManageAlertAndInsightTask = new TestObject("finishManageAlertAndInsightTask")
		xpathQuery = "//*[contains(@class, 'iotaa-form-manage-alerts-internal')]//*[text()='Summary']/ancestor::div[2]/following-sibling::div//*[text()='finish']"
		finishManageAlertAndInsightTask.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(finishManageAlertAndInsightTask)




		// -----------------------------------------------------------------
		// 1) navigate to the No Movement script in the IoT test tool
		anthrUtils.openWebBrowser()
		WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + '/PumpHouse/iotTest/')

		// 1.1) Select john jenkins
		selectClient = new TestObject("selectClient")
		xpathQuery = "//select[@id='client']"
		selectClient.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectClient, 'John Jenkins', false)

		// 1.2) click continue
		def clickContinue = new TestObject("clickContinue")
		xpathQuery = "//input[@id='continue']"
		clickContinue.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickContinue)

		// 2) For package => No Movement detected in high risk area - alert
		def selectPackage = new TestObject("selectPackage")
		xpathQuery = "//select[@id='package']"
		selectPackage.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectPackage, 'No movement detected in high risk area - alert', false)

		// 3) Set Client Status to => enabled
		def selectClientStatus = new TestObject("selectClientStatus")
		xpathQuery = "//select[@id='clientPackageStatus']"
		selectClientStatus.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectClientStatus, 'enabled', false)

		// 4) Set Franchise status to => enabled
		def selectFranchiseStatus = new TestObject("selectFranchiseStatus")
		xpathQuery = "//select[@id='franchisePackageStatus']"
		selectFranchiseStatus.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectFranchiseStatus, 'enabled', false)

		// 5) Device => Bathroom Motion Sensor
		def selectDeviceOne = new TestObject("selectDeviceOne")
		xpathQuery = "//select[@id='device_1']"
		selectDeviceOne.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectDeviceOne, 'Bathroom Motion Sensor', false)

		// 6) Event => Motion Sensor movement on
		def selectEventOne = new TestObject("selectEventOne")
		xpathQuery = "//select[@id='event_1']"
		selectEventOne.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectEventOne, 'Motion Sensor movement on', false)

		// 7) Day => today
		def selectDayOne = new TestObject("selectDayOne")
		xpathQuery = "//select[@id='day_1']"
		selectDayOne.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectDayOne, 'Today', false)

		// 8) Time => 08:00
		def selectTimeOne = new TestObject("selectTimeOne")
		xpathQuery = "//input[@id='time_1']"
		selectTimeOne.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		// WebUI.selectOptionByLabel(selectTimeOne, 'Today', false)
		WebUI.setText(selectTimeOne, '08:00')

		// Then below
		// ----------
		// 9) Device => Bathroom Motion Sensor
		def selectDeviceTwo = new TestObject("selectDeviceTwo")
		xpathQuery = "//select[@id='device_2']"
		selectDeviceTwo.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectDeviceTwo, 'Bathroom Motion Sensor', false)

		// 10) Event => Motion Sensor movement on
		def selectEventTwo = new TestObject("selectEventTwo")
		xpathQuery = "//select[@id='event_2']"
		selectEventTwo.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectEventTwo, 'Motion Sensor movement off', false)

		// 11) Day => today
		def selectDayTwo = new TestObject("selectDayTwo")
		xpathQuery = "//select[@id='day_2']"
		selectDayTwo.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectDayTwo, 'Today', false)

		// 12) Time => 08:01
		def selectTimeTwo = new TestObject("selectTimeTwo")
		xpathQuery = "//input[@id='time_2']"
		selectTimeTwo.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		// WebUI.selectOptionByLabel(selectTimeOne, 'Today', false)
		WebUI.setText(selectTimeTwo, '08:01')

		// Note
		// ---------
		// You can set the time (skip manually setting as above) by adding the current time to the 'set current time to' field

		// 13) Then run job => No movement in high-risk area
		def selectNextJob = new TestObject("selectNextJob")
		xpathQuery = "//select[@id='job']"
		selectNextJob.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectNextJob, 'No Movement in High-risk area', false)

		// 14) click the run button!
		def clickRun = new TestObject("clickRun")
		xpathQuery = "//input[@id='query']"
		clickRun.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickRun)

		// Actionable insights card
		//		goToPumpAdmin()
		//		setupDemoScript('com.pumpco.iotaa.NoKettleForTimeScript')
		//		runSetupDemoScript()
		//		setupDemoScriptComplete()

		// -- //*[contains(text(),'Actionable Insights')]/ancestor::div[@class='iotaa-card-head']/following-sibling::div


		// Tools
		// @TODO
	}

	/**
	 * JCARNEY 28/06/19: Marked for deletion.
	 * Having searched for the gherkin step, it appears in the archived feature
	 * - repository/visual-regression-testing/iotaa-project/Include/features/Archived_features/dataGeneration.feature
	 * 
	 * Needed so that the Alerts card displays data 
	 */
	@Given('Create second lot of data')
	def secondRoundOfLocalOfficeData() {

		def xpathQuery = ''
		def selectClient = ''

		// Notifications
		// 1) Navigate to the head office
		fullLoginProcess('Head Office', 'admin.iotaa', 'onetwothree')

		// 2) click on apps sidebar button
		def clickSidebarAppsBtn = new TestObject("clickSidebarAppsBtn")
		xpathQuery = "//body//*[contains(@name, 'Iotaa.anthroposSupportLandingPageLeftCog')]//button[text()='Apps']"
		clickSidebarAppsBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickSidebarAppsBtn)

		// 3) click on admin tile
		def clickAdminCog = new TestObject("clickAdminCog")
		xpathQuery = "//body//*[contains(@name, 'System.HomeSpace')]//*[@name='Iotaa.adminNav']"
		clickAdminCog.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickAdminCog)

		// 4) select manage alerts and insights
		def selectNanageAlertsAndInsights = new TestObject("selectNanageAlertsAndInsights")
		xpathQuery = "//*[contains(text(),'Admin tasks')]/ancestor::div/following-sibling::div[2]//select"
		selectNanageAlertsAndInsights.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectNanageAlertsAndInsights, 'Manage Alerts & Insights', false)

		// 5) click next
		anthrAppflows.selectNextAppflow('Admin tasks')

		// 6) select bristol
		def selectOffice = new TestObject("selectOffice")
		xpathQuery = "//*[contains(text(),'Select Local Office')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'Bristol') ]"
		selectOffice.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectOffice)

		// 7) click next
		anthrAppflows.selectNextAppflow('Select Local Office')

		// 8) select john jenkins
		// NOTE: the xpath should form a function that serves a select list (orange backed item)
		selectClient = new TestObject("selectClient")
		xpathQuery = "//*[contains(text(),'Client')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'John') ]"
		selectClient.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectClient)

		// 9) click next
		anthrAppflows.selectNextAppflow('Client')

		// 10) Alerts during office hours => select family app
		def selectAlertAndInsightRecipients_alertsDuring = new TestObject("selectAlertAndInsightRecipients_alertsDuring")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[1]"
		selectAlertAndInsightRecipients_alertsDuring.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsDuring, 'Office Dashboard', false)

		// 11) Alerts out of office hours => select family app
		def selectAlertAndInsightRecipients_alertsOut = new TestObject("selectAlertAndInsightRecipients_alertsOut")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[2]"
		selectAlertAndInsightRecipients_alertsOut.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsOut, 'Office Dashboard', false)

		// 12) Actionable Insights => select family app
		def selectAlertAndInsightRecipients_AIs = new TestObject("selectAlertAndInsightRecipients_AIs")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[3]"
		selectAlertAndInsightRecipients_AIs.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_AIs, 'Office Dashboard', false)


		// 13) click next
		anthrAppflows.selectNextAppflow('Select Alert & Insight recipients')

		// 18) click next
		anthrAppflows.selectNextAppflow('Notification methods')


		// 19) click finish
		def finishManageAlertAndInsightTask = new TestObject("finishManageAlertAndInsightTask")
		xpathQuery = "//*[contains(@class, 'iotaa-form-manage-alerts-internal')]//*[text()='Summary']/ancestor::div[2]/following-sibling::div//*[text()='finish']"
		finishManageAlertAndInsightTask.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(finishManageAlertAndInsightTask)

	}



	/**
	 * JCARNEY 28/06/19: Marked for deletion. 
	 * Having searched for the gherkin step, it appears commented out in:
	 * - repository/visual-regression-testing/iotaa-project/Include/features/Anthropos/dataGeneration/familyAppContentGeneration.feature 
	 * 
	 * Needed so that the Alerts card displays data
	 */
	@Given('Create third lot of data')
	def thirdRoundOfLocalOfficeData() {

		def xpathQuery = ''
		def selectClient = ''

		// Notifications
		// 1) Navigate to the head office
		fullLoginProcess('Head Office', 'admin.iotaa', 'onetwothree')

		// 2) click on apps sidebar button
		def clickSidebarAppsBtn = new TestObject("clickSidebarAppsBtn")
		xpathQuery = "//body//*[contains(@name, 'Iotaa.anthroposSupportLandingPageLeftCog')]//button[text()='Apps']"
		clickSidebarAppsBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickSidebarAppsBtn)

		// 3) click on admin tile
		def clickAdminCog = new TestObject("clickAdminCog")
		xpathQuery = "//body//*[contains(@name, 'System.HomeSpace')]//*[@name='Iotaa.adminNav']"
		clickAdminCog.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickAdminCog)

		// 4) select manage alerts and insights
		def selectNanageAlertsAndInsights = new TestObject("selectNanageAlertsAndInsights")
		xpathQuery = "//*[contains(text(),'Admin tasks')]/ancestor::div/following-sibling::div[2]//select"
		selectNanageAlertsAndInsights.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectNanageAlertsAndInsights, 'Manage Alerts & Insights', false)

		// 5) click next
		anthrAppflows.selectNextAppflow('Admin tasks')

		// 6) select bristol
		def selectOffice = new TestObject("selectOffice")
		xpathQuery = "//*[contains(text(),'Select Local Office')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'Bristol') ]"
		selectOffice.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectOffice)

		// 7) click next
		anthrAppflows.selectNextAppflow('Select Local Office')

		// 8) select john jenkins
		// NOTE: the xpath should form a function that serves a select list (orange backed item)
		selectClient = new TestObject("selectClient")
		xpathQuery = "//*[contains(text(),'Client')]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(text(), 'John') ]"
		selectClient.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectClient)

		// 9) click next
		anthrAppflows.selectNextAppflow('Client')

		// 10) Alerts during office hours => select office dashboard
		def selectAlertAndInsightRecipients_alertsDuring = new TestObject("selectAlertAndInsightRecipients_alertsDuring")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[1]"
		selectAlertAndInsightRecipients_alertsDuring.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsDuring, 'Office Dashboard', false)

		// 11) Alerts out of office hours => select family app
		def selectAlertAndInsightRecipients_alertsOut = new TestObject("selectAlertAndInsightRecipients_alertsOut")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[2]"
		selectAlertAndInsightRecipients_alertsOut.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsOut, 'Family App', false)

		// 12) Actionable Insights => select office dashboard
		def selectAlertAndInsightRecipients_AIs = new TestObject("selectAlertAndInsightRecipients_AIs")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[3]"
		selectAlertAndInsightRecipients_AIs.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_AIs, 'Office Dashboard', false)




		// 13) click next
		anthrAppflows.selectNextAppflow('Select Alert & Insight recipients')

		// 13.1) Who to escalate to => select Other
		def escalateToOutOfOfficeHours = new TestObject("escalateToOutOfOfficeHours")
		xpathQuery = "//body//*[text()='How to deal with alerts not acknowledged on the Family App']/ancestor::div[1]/following-sibling::div[2]//div[2]//select"
		escalateToOutOfOfficeHours.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(escalateToOutOfOfficeHours, 'Other', false)

		// 13.2)
		anthrAppflows.selectNextAppflow('How to deal with alerts not acknowledged on the Family App')

		// JC: 24/4/19: works during office hours, ie, 8am-6pm
		// 15.1)
		def a = new TestObject("a")
		xpathQuery = "//span[@class='phone-number']/input[1]"
		a.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		def phonePortionOne = '12345'
		WebUI.setText(a, phonePortionOne)

		// 15.2)
		def b = new TestObject("b")
		xpathQuery = "//span[@class='phone-number']/input[2]"
		b.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		def phonePortionTwo = '618910'
		WebUI.setText(b, phonePortionOne)

		// 15.3)
		anthrAppflows.selectNextAppflow('Please specify contact details for alert escalation ouside of office hours')

		// 15) click next
		//anthrAppflows.selectNextAppflow('How to deal with alerts not acknowledged on the Family App')

		// 18) click next
		anthrAppflows.selectNextAppflow('Notification methods')


		// 19) click finish
		def finishManageAlertAndInsightTask = new TestObject("finishManageAlertAndInsightTask")
		xpathQuery = "//*[contains(@class, 'iotaa-form-manage-alerts-internal')]//*[text()='Summary']/ancestor::div[2]/following-sibling::div//*[text()='finish']"
		finishManageAlertAndInsightTask.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(finishManageAlertAndInsightTask)

	}

	/**************************************************************************************************************
	 * I go to the environment
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin: 
	 * _Step_: I go to the environment. Description: Goes to the environment that is selected in the Execution Profile.
	 */
	@Given("I go to the environment")
	def goToTestEnvironment() {
		anthrUtils.openWebBrowser()
		// https://iotaa-test.anthropos.io/anthropos
		// WebUI.navigateToUrl('https://iotaa-test.anthropos.io/anthropos')
		if(GlobalVariable.G_SiteURL == 'dev.cnect.to') {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + GlobalVariable.G_iotaaPathPostfix)
		} else {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL)
		}
	}

	/**************************************************************************************************************
	 * Login to application
	 **************************************************************************************************************/

	/**
	 * !! DEPRECATED !!
	 * @anthropos-gherkin:
	 * _Step_: login to (.*) as (.*) using (.*). Description: Logs in to the application as the specified user, using the environment selected from the execution profile. <br><br><strong>Example usage:</strong><br>login to Head Office as admin.iotaa using onetwothree 
	 */
	@Given('login to (.*) as (.*) using (.*)')
	def fullLoginProcess(String application, String username, String password) {
		// 1
		anthrUtils.openWebBrowser()
		// https://iotaa-test.anthropos.io/anthropos
		// WebUI.navigateToUrl('https://iotaa-test.anthropos.io/anthropos')
		if(GlobalVariable.G_SiteURL == 'dev.cnect.to') {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + GlobalVariable.G_iotaaPathPostfix)
		} else {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL)
		}

		// 2
		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2'), username)

		// 3
		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2_1'), password)

		// 4
		WebUI.click(findTestObject('IoTAA_Common_Items/button_sign in'))

		// 5
		def xpathQuery = ''

		if(application == 'Head Office') {
			xpathQuery = "//*[contains(@name, 'Iotaa.anthroposSupportLandingPageSpace')]//*[contains(@name, 'Iotaa.anthroposSupportLandingPageRightCog')]"
		}

		if(application == 'Local Office') {
			xpathQuery = '//*[contains(@name, "Iotaa.localOfficeLandingPageRightCog")]'
		}

		if(application == 'Family App') {
			xpathQuery = '//*[contains(@name, "Iotaa.helperLandingPageSpace" )]'
		}

		if(application == 'Pre Installer') {
			xpathQuery = '//*[contains(@name, "Iotaa.preinstallerLandingPageCog")]'
		}

		if(application == 'Installation Tool') {
			xpathQuery = '//*[contains(@name, "Iotaa.installerLandingPageSpace" )]'
		}

		if(application == 'HIA Admin') {
			xpathQuery = "//*[contains(@name, 'Iotaa.hiaAdminLandingPageSpace')]//*[contains(@class,'cog-body') ]"
		}

		println 'application var is: ' + application
		println 'the xpathQuery var is: ' + xpathQuery

		def dashboardVisible = new TestObject('dashboardVisible')
		dashboardVisible.addProperty("xpath", ConditionType.EQUALS,
				xpathQuery, true)
		WebUI.verifyElementVisible(dashboardVisible)

		def stringifiedObject =  JsonOutput.toJson(dashboardVisible)
		println JsonOutput.prettyPrint(stringifiedObject)
	}

	// JC 7/5/19: glue code to login without needing a password
	/// This should be used moving forward as opposed to using fullLoginProcess()
	/**
	 * @anthropos-gherkin:
	 * Step: (.*) - login with (.*). Description: Use this step for logging into the desired dashboard as the desired user. <br><br><strong>Example usage:</strong><br>Head Office - login with admin.iotaa
	 */
	@Given('(.*) - login with (.*)')
	def x_login_with_x(String application, String username) {
		navigateToEnvironment()

		// 2
		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2'), username)

		// 3
		WebUI.setText(findTestObject('IoTAA_Common_Items/input_txt width6 height2_1'), GlobalVariable.G_dashboard_password)

		// 4
		WebUI.click(findTestObject('IoTAA_Common_Items/button_sign in'))
	}

	def navigateToEnvironment() {
		// 1
		anthrUtils.openWebBrowser()
		// https://iotaa-test.anthropos.io/anthropos
		// WebUI.navigateToUrl('https://iotaa-test.anthropos.io/anthropos')
		if(GlobalVariable.G_SiteURL == 'dev.cnect.to') {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL + GlobalVariable.G_iotaaPathPostfix)
			return WebUI.getUrl()
		} else {
			WebUI.navigateToUrl('https://admin:r353tFixture@' + GlobalVariable.G_SiteURL)
			return WebUI.getUrl()
		}
	}

	// JC 3/6/19: assert we are on the Gherkin specified dashboard
	// !! We may want to use this function, but expect we will prefer using 'I confirm (.*) is visible' in appflows.groovy !!
	/**
	 * @anthropos-gherkin:
	 * _Step_: xxx. Description: Use this step for logging into the desired dashboard as the desired user. <br><br><strong>Example usage:</strong><br>Head Office - login with admin.iotaa
	 */
	@Given('confirm i am on the (.*) dashboard')
	def confirm_i_am_on_the_x_dashboard(String application){
		def xpathQuery = ''

		if(application == 'Head Office') {
			xpathQuery = "//*[contains(@name, 'Iotaa.anthroposSupportLandingPageSpace')]//*[contains(@name, 'Iotaa.anthroposSupportLandingPageRightCog')]"
		}

		if(application == 'Local Office') {
			xpathQuery = '//*[contains(@name, "Iotaa.localOfficeLandingPageRightCog")]'
		}

		if(application == 'Family App') {
			xpathQuery = '//*[contains(@name, "Iotaa.helperLandingPageSpace" )]'
		}

		if(application == 'Pre Installer') {
			xpathQuery = '//*[contains(@name, "Iotaa.preinstallerLandingPageCog")]'
		}

		if(application == 'Pre Admin') {
			xpathQuery = '//*[contains(@name, "Iotaa.preinstallAdminLandingPageSpace")]'
		}

		if(application == 'Installation Tool') {
			xpathQuery = '//*[contains(@name, "Iotaa.installerLandingPageSpace" )]'
		}

		if(application == 'HIA Admin') {
			xpathQuery = "//*[contains(@name, 'Iotaa.hiaAdminLandingPageSpace')]//*[contains(@class,'cog-body') ]"
		}

		if(application == 'Anthropos Admin') {
			xpathQuery = '//*[contains(@name, "Iotaa.preinstallerLandingPageSpace")]'
		}

		// Iotaa.preinstallerLandingPageSpace

		println 'application var is: ' + application
		println 'the xpathQuery var is: ' + xpathQuery

		def dashboardVisible = new TestObject('dashboardVisible')
		dashboardVisible.addProperty("xpath", ConditionType.EQUALS,
				xpathQuery, true)
		WebUI.verifyElementVisible(dashboardVisible)

		def stringifiedObject =  JsonOutput.toJson(dashboardVisible)
		println JsonOutput.prettyPrint(stringifiedObject)
	}


	/**************************************************************************************************************	 
	 * Install Tool
	 **************************************************************************************************************/

	/**
	 * !! DEPRECATED !!
	 * 
	 * @anthropos-gherkin:
	 * _Step_: I select the (.*) drop down icon in the (.*) card. Description: Clicks the downward facing arrow icon. The icon is displayed within a card item, and is used to display something that is hidden/collapsed. <br><br><strong>Example usage:</strong><br> I select the first drop down icon in the New Install Requests card<br><img src="../dictionary-doc/gherkin-doc-screenshots/I select the (.*) drop down icon in the (.*) card.png" /> 
	 */
	@Given('I select the (.*) drop down icon in the (.*) card')
	def selectClientDropDown(String a, String b) {
		def itemNumber = ""

		// def a = 'first'
		// def b = 'New Install Requests'

		switch(a) {
			//There is case statement defined for 4 cases
			// Each case statement section has a break condition to exit the loop

			case "first":
				itemNumber = '[1]';
				println("Select 1st item");
				break;
			case "second":
				itemNumber = '[2]';
				println("Select 2nd item");
				break;
			case "third":
				itemNumber = '[3]';
				println("Select 3rd item");
				break;
			case "fourth":
				itemNumber = '[4]';
				println("Select 4th item");
				break;
			default:
				itemNumber = '[1]';
				println("Default to the first item");
				break;
		}

		def clientDropDown = new TestObject('clientDropDown')
		clientDropDown.addProperty("xpath", ConditionType.EQUALS,
				"(//*[contains(text(),'" + b + "')]/ancestor::div[@class='iotaa-card-list']//*[contains(@class, 'btn-expander')])"+itemNumber, true)
		WebUI.click(clientDropDown)

		// -- (//*[contains(text(),'My Install Requests')]/ancestor::div[@class='iotaa-card-list']//*[contains(@class, 'btn-expander')])[4]
	}

	/** 
	 * !! DEPRECATED !!
	 * 
	 * @anthropos-gherkin:
	 * _Step_: I click the (.*) card (.*) link. Description: Clicks the link exposed by the downward facing arrow icon.<br><br><strong>Example usage:</strong><br>I click the New Install Requests card start link<br><img src="../dictionary-doc/gherkin-doc-screenshots/I click the (.*) card (.*) link.png" />
	 */
	@Given('I click the (.*) card (.*) link')
	def clickCardItem(String a, String cardItem) {
		cardItem = cardItem.toLowerCase()
		cardItem = cardItem.capitalize()

		def cardItemObject = new TestObject('cardItemObject')
		cardItemObject.addProperty("xpath", ConditionType.EQUALS,
				"(//*[contains(text(),'" + a + "')]/ancestor::div[@class='iotaa-card-list']//*[contains(text(), '"+ cardItem + "')])", true)
		WebUI.click(cardItemObject)

		// -- (//*[contains(text(),'My Install Requests')]/ancestor::div[@class='iotaa-card-list']//*[contains(text(), 'Open')])
	}

	/**
	 * !! DEPRECATED !! - is currently in use as of 14/6/19. To get this working i would need to update the xpath query.
	 * 
	 * @anthropos-gherkin:
	 * _Step_: I click the (.*) link in the card containing (.*). Description: Use this step for clicking the specified link in the specified card. <br><br><strong>Example usage:</strong><br>I click the Start link in the card containing 001-00001
	 */
	@And('I click the (.*) link in the card containing (.*)')
	def i_click_the_x_link_in_the_x_card(String linkName, String cardContent) {
		//		cardName = cardName.toLowerCase()
		//		cardName = cardName.replace(' ', '')

		linkName = linkName.toLowerCase()

		// -- //*[@data-ui-test='aos.card.title' and contains(text(), '001-00002')]//ancestor::div//*[@data-ui-test='aos.action.link']
		def xpathQuery = " //*[@data-ui-test='aos.card.title' and contains(text(), '"+cardContent+"')]//ancestor::div[2]//*[@data-ui-test='aos.action.link' and "+anthrUtils.xpathToLowerConditionalStatement(linkName)+"] "

		def linkElement = new TestObject('linkElement')
		linkElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(linkElement)

	}


	/**************************************************************************************************************
	 * Low level Gherkin: Local Office
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: check (.*) card is displayed. Description: Checks each card has been displayed in the Head / Local Office dashboard.<br><br><strong>Example usage:</strong><br>check Alerts card is displayed
	 */	
	@And('check (.*) card is displayed')
	def checkCardDisplayed(String cardName) {

		// JC 5/5/19: Commented out so to try and resolve issues with stale element references
		//		println 'Currently checking card: ' + cardName
		//		def xpathQuery = " //body//div[@name='Iotaa.localOfficeLandingPageSpace']//div[contains(@class, 'iotaa-card')]//*[contains(text(),'"+cardName+"')]/ancestor::div[@class='iotaa-card-head']/following-sibling::div "
		//
		//		if(cardName == 'Service Status' || cardName == 'First Morning Activity') {
		//			xpathQuery = " //body//div[@name='Iotaa.localOfficeLandingPageSpace']//div[contains(@class, 'iotaa-card')]//*[contains(text(),'"+cardName+"')]/ancestor::div[@class='iotaa-card-head']/following-sibling::csv-table "
		//		}
		//
		//		println 'The xpathQuery >> ' + xpathQuery + ' << is being using against ' + cardName + '\r\r'
		//		def cardDisplayed = new TestObject('cardDisplayed')
		//		cardDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		//
		//		// JC 4/5/19: commented out so to use waitForElementVisible()
		//		// WebUI.verifyElementVisible(cardDisplayed)
		//		WebUI.waitForElementVisible(cardDisplayed, GlobalVariable.G_Timeout)
		//
		// JC 5/5/19: Use a for loop to try and resolve issues with stale element references
		def dashboardCard = ['alerts', 'notifications', 'insights', 'status', 'clients', 'tools']

		for (def i = 0; i < dashboardCard.size(); i++) {
			println("The dashboard card is: " + dashboardCard[i] + "\n")
			WebUI.delay(2)

			def xpathQuery = ''
			// xpathQuery = " //body//div[@name='Iotaa.localOfficeLandingPageSpace']//div[contains(@class, 'iotaa-card')]//*[contains(text(),'"+dashboardCard[i]+"')]/ancestor::div[@class='iotaa-card-head']/following-sibling::div "

			xpathQuery = " //div[contains( @class, 'iotaa-main')]//div[contains(@class, 'main-body')]//div[contains(@data-bind, 'data.isExpanded."+dashboardCard[i]+"')] "

			def cardDisplayedName = 'cardDisplayed'+i
			println "The card number is: " + cardDisplayedName + "\n"
			def cardDisplayed = new TestObject(cardDisplayedName)
			cardDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

			// Checks if the weather data is available. if so, we can verify the element, if not, we can verify there is no card
			try {
				WebUI.waitForElementVisible(cardDisplayed, GlobalVariable.G_Timeout)
				// println "Test to see whether card " + dashboardCard[i] + " (with content) is visible has passed! \r\r"
			}
			catch(Exception e) {
				println '\r\r check dahsboard cards exception thrown is: ' + e + '\r\r'

				println 'Trying to wait again... \r\r'

				def isCardVisible = WebUI.waitForElementVisible(cardDisplayed, GlobalVariable.G_Timeout)
				println "Ater trying again, " + dashboardCard[i] + " is: " + isCardVisible + "\r\r"
			}
		}
	}

	// JC 24/05/19: changing nomenclature for containers and cards

	/**
	 * @anthropos-gherkin:
	 * Step: collapse (.*) container. Description: Use this step for shrinking the size of a container (containers house other content such as cards) - this hides the containers contents. <br><br><strong>Example usage:</strong><br>collapse Alerts container
	 */
	@And('collapse (.*) container')
	def collapse_x_container(String cardName) {
		cardName = cardName.toLowerCase()
		cardName = cardName.replace(' ', '')
		def xpathQuery = " //*[@data-ui-test='aos.container."+cardName+"']//*[@data-ui-test='aos.action.expand'] "
		println 'xpathQuery is: ' + xpathQuery
		def collapseCard = new TestObject('collapseCard')
		collapseCard.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(collapseCard)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: expand (.*) container. Description: Use this step for expanding the size of a container (containers house other content such as cards) - this displays the containers contents. <br><br><strong>Example usage:</strong><br>expand Alerts container
	 */
	@And('expand (.*) container')
	def expand_x_container(String cardName) {
		cardName = cardName.toLowerCase()
		cardName = cardName.replace(' ', '')
		def xpathQuery = " //*[@data-ui-test='aos.container."+cardName+"']//*[@data-ui-test='aos.action.expand'] "
		println 'xpathQuery is: ' + xpathQuery
		def expandCard = new TestObject('expandCard')
		expandCard.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(expandCard)
	}

	//// cards

	/**
	 * @anthropos-gherkin:
	 * Step: expand card containing (.*). Description: Use this step for expanding the size of the card specified (a card resides in a container)  - this displays the cards content. <br><br><strong>Example usage:</strong><br>expand card containing 001-00001
	 */
	@And('expand card containing (.*)')
	def expand_x_card(String cardContent) {
		//		cardName = cardName.toLowerCase()
		//		cardName = cardName.replace(' ', '')

		// -- //*[@data-ui-test='aos.card.title' and contains(text(), '001-00001')]//ancestor::div//*[@data-ui-test='aos.action.expand']
		def xpathQuery = " //*[@data-ui-test='aos.card.title' and contains(text(), '"+cardContent+"')]//ancestor::div[2]//*[@data-ui-test='aos.action.expand'] "
		println 'xpathQuery is: ' + xpathQuery
		def expandCard = new TestObject('expandCard')
		expandCard.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(expandCard)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: collapse card containing (.*). Description: Use this step for shrinking the size of the card specified (a card resides in a container) - this hides the cards content. <br><br><strong>Example usage:</strong><br>collapse card containing 001-00001
	 */
	@And('collapse card containing (.*)')
	def collapse_x_card(String cardContent) {
		//		cardName = cardName.toLowerCase()
		//		cardName = cardName.replace(' ', '')

		// -- //*[@data-ui-test='aos.card.title' and contains(text(), '001-00001')]//ancestor::div//*[@data-ui-test='aos.action.expand']
		def xpathQuery = " //*[@data-ui-test='aos.card.title' and contains(text(), '"+cardContent+"')]//ancestor::div//*[@data-ui-test='aos.action.expand'] "
		println 'xpathQuery is: ' + xpathQuery
		def expandCard = new TestObject('expandCard')
		expandCard.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(expandCard)
	}


	/**
	 * @anthropos-gherkin:
	 * Step: the Local Office logo is displayed. Description: Checks if the Local Office main logo is displayed in the UI.
	 */
	@Given('the Local Office logo is displayed')
	def checkLocalOfficeLogoDisplayed() {
		def xpathQuery = ''
		// xpathQuery = "//*[contains(@class, 'branding-logo')]"
		xpathQuery = xpathGenerator('localOfficeLogo')
		def logoDisplayed = new TestObject('logoDisplayed')
		logoDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(logoDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I confirm the text (.*) resides in container (.*). Description: Use this step for checking whether your specified text exists within your specified container. ** NOTE: The container should have the html attribute data-ui-test="aos.container.NAMEOFCONTAINER". If not, the test will fail. **<br><br><strong>Example usage:</strong><br>I confirm the text John Jenkins resides in container Alerts
	 */
	// @JC 13/6/19
	@Given('I confirm the text (.*) resides in container (.*)')
	def i_confirm_the_text_x_resides_in_a_container(String cardContent, String container) {
		def xpathQuery = ''

		// JCARNEY 13/6/19: Updated xpath query to be more generic
		// xpathQuery = " //*[@data-ui-test='aos.container' ]//*[contains(text(), '"+cardContent+"')] "

		// JCARNEY 14/6/19: Updated xpath query to be more generic
		container = container.toLowerCase()
		container = container.replace(' ', '')
		xpathQuery = " //*[contains(@data-ui-test, 'aos.container."+container+"') ]//*[contains(text(), '"+cardContent+"')] "

		def cardElement = new TestObject('cardElement')
		cardElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		// @JC 13/6/19: working on https://iotaa.manuscript.com/f/cases/3390/

		// JC 31/5/19: commented out verifyElementVisible() in favour of the better waitForElementVisible()
		// WebUI.waitForElementVisible(cardElement, GlobalVariable.G_Timeout)
		// WebUI.verifyElementPresent(cardElement, GlobalVariable.G_Timeout)

		try {
			assert WebUI.waitForElementVisible(cardElement, GlobalVariable.G_Timeout, FailureHandling.CONTINUE_ON_FAILURE)

		} catch (AssertionError e) {

			println e.getMessage()

			KeywordUtil.markFailed("The element located by WebUI.waitForElementVisible() couldnt be found. Please check the Gherkin step has values you expect to find in the UI.")

		}
	}

	@Given('the Local Office header-console is displayed')
	def checkHeaderConsoleDispalyed() {
		def xpathQuery = ''
		// xpathQuery = "//body/*[@id='header']"
		xpathQuery = xpathGenerator('headerConsole')
		def headerConsoleDisplayed = new TestObject('headerConsoleDisplayed')
		headerConsoleDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(headerConsoleDisplayed)
	}


	/**
	 * @anthropos-gherkin:
	 * Step: contacts, notifications, settings, help are displayed. Description: Use this step for checking if all the shortcuts are displayed in the header console.
	 */
	@Given('contacts, notifications, settings, help are displayed')
	def checkHeaderConsoleShortcutsDisplayed() {
		def xpathQuery = ''

		// contacts shortcut
		// xpathQuery = "//body/*[@id='header']//*[contains(@class,'ico-contacts')]"
		xpathQuery = xpathGenerator('headerConsoleContactsShortcut')
		def headerConsoleContactstDisplayed = new TestObject('headerConsoleContactstDisplayed')
		headerConsoleContactstDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(headerConsoleContactstDisplayed)

		// notifications shortcut
		// xpathQuery = "//body/*[@id='header']//*[@class='header-shortcuts-notifications']//*[contains(@class,'ico-flags')]"
		xpathQuery = xpathGenerator('headerConsoleNotificationsShortcut')
		def headerConsoleNotificationsDisplayed = new TestObject('headerConsoleNotificationsDisplayed')
		headerConsoleNotificationsDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(headerConsoleNotificationsDisplayed)

		// settings shortcut
		// xpathQuery = "//body/*[@id='header']//*[@class='header-shortcuts-settings']//*[contains(@class,'ico-settings')]"
		xpathQuery = xpathGenerator('headerConsoleSettingsShortcut')
		def headerConsoleSettingsDisplayed = new TestObject('headerConsoleSettingsDisplayed')
		headerConsoleSettingsDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(headerConsoleSettingsDisplayed)

		// info/help shortcut
		// xpathQuery = "//body/*[@id='header']//*[@class='header-shortcuts-help']//*[contains(@class,'ico-info')]"
		xpathQuery = xpathGenerator('headerConsoleInfoHelpShortcut')
		def headerConsoleInfoDisplayed = new TestObject('headerConsoleInfoDisplayed')
		headerConsoleInfoDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(headerConsoleInfoDisplayed)
	}

	/**
	 * JCARNEY 28/06/19: Currently cannot be unit tested as Xsoup does not support double-colon selectors
	 * @return
	 */
	@Given('Frequent Tasks, All Availiable Tasks, All Available Reports are displayed')
	def leftSidebarComponentsDisplayed(){
		def xpathQuery = ''

		// available tasks > add frequent button
		xpathQuery = " //body//*[@name='Iotaa.localOfficeLandingPageLeftCog']//p[contains( text(),'All Available Tasks') ]/following-sibling::div[1]//button[contains(@data-bind, 'add-to-useful-reports')] "
		def clickAvailableTasksFrequentBtn = new TestObject('clickAvailableTasksFrequentBtn')
		clickAvailableTasksFrequentBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickAvailableTasksFrequentBtn)

		// available reports > add frequent button
		xpathQuery = " //body//*[@name='Iotaa.localOfficeLandingPageLeftCog']//p[contains( text(),'All Available Tasks') ]/following-sibling::div[2]//button[contains(@data-bind, 'add-to-useful-reports')] "
		def clickAvailableReportsFrequentBtn = new TestObject('clickAvailableReportsFrequentBtn')
		clickAvailableReportsFrequentBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickAvailableReportsFrequentBtn)
	}

	/**************************************************************************************************************
	 * High level Gherkin: Local Office
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: Dashboard cards are displayed. Description: Checks each card has been displayed in the Head / Local Office dashboard.
	 */
	// JC 30/04/19: using this function causes stale element reference: element is not attached to the page document
	// See https://forum.katalon.com/t/stale-element-reference-element-is-not-attached-to-the-page-document/10072/7
	@Given('Dashboard cards are displayed with content')
	def dashboardCardsAreDisplayed() {

		// JC 5/5/19: Commented out so to try and resolve issues with stale element references
		//		checkCardDisplayed('Alerts')
		//		// WebUI.delay(2)
		//
		//		checkCardDisplayed('Notifications')
		//		// WebUI.delay(2)
		//
		//		checkCardDisplayed('Actionable Insights')
		//		// WebUI.delay(2)
		//
		//		checkCardDisplayed('Service Status')
		//		// WebUI.delay(2)
		//
		//		checkCardDisplayed('First Morning Activity')
		//		// WebUI.delay(2)
		//
		//		checkCardDisplayed('Tools')
		//		// WebUI.delay(2)

		// JC 5/5/19: Use a for loop to try and resolve issues with stale element references// JC 5/5/19: Use a for loop to try and resolve issues with stale element references
		checkCardDisplayed()
	}

	/**
	 * @anthropos-gherkin:
	 * Step: confirm feature is complete. Description: <span>**Recommended Gherkin step: Add this step to the very bottom of your feature.**</span><br><br>Use this step for confirming that you have finished the feature. Behind the scenes, this closes the web browser and associated system processes; recommended for ensuring your system runs as optimal capacity. 
	 */
	@Given('confirm feature is complete')
	def confirm_feature_is_complete() {
		WebUI.closeBrowser()
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I click the (.*) button in the (.*) table. Description: Use this step for clicking a link that is inside a table. <br><br><strong>Example usage:</strong><br>I click the manage button in the installations table
	 */
	@Given('I click the (.*) button in the (.*) table')
	def i_click_the_manage_button_in_the_installations_table(String linkName, String tableName) {
		// -- //*[@data-ui-test='aos.component.csvtable']//*[@data-ui-test='aos.action.link' and contains(text(), 'manage')]
		// def xpathQuery = "//*[@data-ui-test='aos.component.csvtable']//*[@data-ui-test='aos.action.link']"
		def xpathQuery = xpathGenerator('installationTableManageBtn')
		def buttonElement = new TestObject('buttonElement')
		buttonElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(buttonElement)
	}



	// END class
}
