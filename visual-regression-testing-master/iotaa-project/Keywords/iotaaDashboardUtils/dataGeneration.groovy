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
import com.kms.katalon.core.testobject.ObjectRepository
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords

import internal.GlobalVariable

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

// @JC 17/4/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

import iotaaDashboardUtils.Utilities as anthrUtils

// JC 2/5/19: updated to use new reusableGludeCode package name
// import iotaaDashboardUtils.appflows as anthrAppflows
import reusableGlueCode.appflows as anthrAppflows

import iotaaDashboardUtils.glueCode as anthrGlueCode

class dataGeneration {

	def anthrUtils = new anthrUtils()
	def anthrAppflows = new anthrAppflows()
	def anthrGlueCode = new anthrGlueCode()

	// First morning activity
	@Given('navigate to iot test tool')
	def navigate_to_iot_test_tool() {
		anthrUtils.openWebBrowser()
		WebUI.navigateToUrl('https://admin:r353tFixture@'+ GlobalVariable.G_SiteURL +'/PumpHouse/iotTest/')

		// 1.1) Select john jenkins
		def selectClient = new TestObject("selectClient")
		def xpathQuery = "//select[@id='client']"
		selectClient.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectClient, 'John Jenkins', false)

		// 1.2) click continue
		def clickContinue = new TestObject("clickContinue")
		xpathQuery = "//input[@id='continue']"
		clickContinue.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickContinue)

		// 1) select chair
		def selectChair = new TestObject("selectChair")
		selectChair.addProperty("xpath", ConditionType.EQUALS, "//select[@id='device_1']", true)
		WebUI.selectOptionByLabel(selectChair, 'Chair', false)

		// 2) select pir movement on
		def selectPirMovementOn = new TestObject("selectPirMovementOn")
		selectPirMovementOn.addProperty("xpath", ConditionType.EQUALS, "//select[@id='event_1']", true)
		WebUI.selectOptionByLabel(selectPirMovementOn, 'Chair sensor on', false)

		// 3) enter time 7am
		// -- //input[@id='time_1']
		def inputTimePirMovementTime = new TestObject("inputTimePirMovementTime")
		inputTimePirMovementTime.addProperty("xpath", ConditionType.EQUALS, "//input[@id='time_1']", true)
		WebUI.setText(inputTimePirMovementTime, '09:46')

		// 4) select 2nd chair
		// selectChair = new TestObject("selectChair")
		selectChair.addProperty("xpath", ConditionType.EQUALS, "//select[@id='device_2']", true)
		WebUI.selectOptionByLabel(selectChair, 'Chair', false)

		// 5) select pir movement off
		// selectPirMovementOn = new TestObject("selectPirMovementOn")
		selectPirMovementOn.addProperty("xpath", ConditionType.EQUALS, "//select[@id='event_2']", true)
		WebUI.selectOptionByLabel(selectPirMovementOn, 'Chair sensor off', false)

		// 6) enter time 8am
		inputTimePirMovementTime.addProperty("xpath", ConditionType.EQUALS, "//input[@id='time_2']", true)
		WebUI.setText(inputTimePirMovementTime, '10:14')

		// 7) click run button
		// -- //input[@value='Run']
		def clickRun = new TestObject("clickRun")
		clickRun.addProperty("xpath", ConditionType.EQUALS, "//input[@value='Run']", true)
		WebUI.click(clickRun)
	}

	@Given('unpause the hub')
	def unpause_the_hub() {

	}

	@Given('reset pumphouse time to (.*) hundred hours')
	def reset_pumphouse_time_to_nine_am(String hour) {
		anthrUtils.openWebBrowser()
		def theUrl = 'https://admin:r353tFixture@'+ GlobalVariable.G_SiteURL +'/PumpHouse/pumpAdmin/utils'
		WebUI.navigateToUrl(theUrl)

		def setTime = new TestObject("setTime")
		def xpathQuery = "//select[@name='hour']"
		setTime.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(setTime, hour, false)

		// //input[@name='changeTime']
		def clickChangeTimeButton = new TestObject("clickChangeTimeButton")
		xpathQuery = "//input[@name='changeTime']"
		clickChangeTimeButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickChangeTimeButton)
	}

	@Given('select alert and insight recipients for (.*)')
	def select_alert_and_insight_recipients_for_x(String recipient) {
		def xpathQuery = ''
		def selectClient = ''

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

		// 5.1) Select customer
		def selectableItemElement = new TestObject('selectableItemElement')
		xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'Select customer')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Customer' ) ]/following-sibling::div/div[contains( @data-name, 'select') ]//p[contains(text(), 'Home Instead')] "
		selectableItemElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectableItemElement)

		// 5.2) click next
		anthrAppflows.selectNextAppflow('Select customer')

		// 6) select bristol
		def selectOffice = new TestObject("selectOffice")
		xpathQuery = "//*[contains( translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'select local office' )]/ancestor::div/following-sibling::div//*[contains( @data-bind, 'click:oFlipSelected') ]//*[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'bristol') ]"
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
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsDuring, recipient, false)

		// 11) Alerts out of office hours => select family app
		def selectAlertAndInsightRecipients_alertsOut = new TestObject("selectAlertAndInsightRecipients_alertsOut")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[2]"
		selectAlertAndInsightRecipients_alertsOut.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_alertsOut, recipient, false)

		// 12) Actionable Insights => select family app
		def selectAlertAndInsightRecipients_AIs = new TestObject("selectAlertAndInsightRecipients_AIs")
		xpathQuery = "(//body//*[text()='Select Alert & Insight recipients']/ancestor::div[1]/following-sibling::div[2]//select)[3]"
		selectAlertAndInsightRecipients_AIs.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(selectAlertAndInsightRecipients_AIs, recipient, false)

		// 13) click next
		anthrAppflows.selectNextAppflow('Select Alert & Insight recipients')

		// Here, we do Family App specific stuff
		if(recipient == 'Family App') {

			// How to deal with alerts not acknowledged on the Family App

			// 14) Who to escalate to => select Other
			def escalateToOfficeHours = new TestObject("escalateToOfficeHours")
			xpathQuery = "//body//*[text()='How to deal with alerts not acknowledged on the Family App']/ancestor::div[1]/following-sibling::div[2]//div[2]//select"
			escalateToOfficeHours.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			WebUI.selectOptionByLabel(escalateToOfficeHours, 'Other', false)

			// 15) click next
			anthrAppflows.selectNextAppflow('How to deal with alerts not acknowledged on the Family App')

			// JC: 24/4/19: works during office hours, ie, 8am-6pm
			// 15.1)
			def a = new TestObject("a")
			xpathQuery = "//span[@class='phone-number']/input[1]"
			a.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			def phonePortionOne = '01632'
			WebUI.setText(a, phonePortionOne)

			// 15.2)
			def b = new TestObject("b")
			xpathQuery = "//span[@class='phone-number']/input[2]"
			b.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			def phonePortionTwo = '123456'
			WebUI.setText(b, phonePortionOne)

			// 15.3)
			anthrAppflows.selectNextAppflow('Please specify contact details for alert escalation during office hours')


			// 16) Who to escalate to => select Other
			def escalateToOutOfOfficeHours = new TestObject("escalateToOutOfOfficeHours")
			xpathQuery = "//body//*[text()='How to deal with alerts not acknowledged on the Family App']/ancestor::div[1]/following-sibling::div[2]//div[2]//select"
			escalateToOutOfOfficeHours.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			WebUI.selectOptionByLabel(escalateToOutOfOfficeHours, 'Other', false)

			// 16.1) click next
			anthrAppflows.selectNextAppflow('How to deal with alerts not acknowledged on the Family App')


			// JC: 24/4/19: works during office hours, ie, 8am-6pm
			// 16.2)
			a = new TestObject("a")
			xpathQuery = "//span[@class='phone-number']/input[1]"
			a.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			phonePortionOne = '01632'
			WebUI.setText(a, phonePortionOne)

			// 16.3)
			b = new TestObject("b")
			xpathQuery = "//span[@class='phone-number']/input[2]"
			b.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			phonePortionTwo = '123456'
			WebUI.setText(b, phonePortionOne)

			// 16.4)
			anthrAppflows.selectNextAppflow('Please specify contact details for alert escalation ouside of office hours')

		}

		// 18) click next
		anthrAppflows.selectNextAppflow('Notification methods')

		// 19) click finish
		def finishManageAlertAndInsightTask = new TestObject("finishManageAlertAndInsightTask")
		xpathQuery = "//*[contains(@class, 'iotaa-form-manage-alerts-internal')]//*[text()='Summary']/ancestor::div[2]/following-sibling::div//*[text()='finish']"
		finishManageAlertAndInsightTask.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(finishManageAlertAndInsightTask)
	}

	@Given('run (.*) in pumpadmin')
	def run_x_script_in_pumpadmin(String scriptToRun) {
		anthrGlueCode.goToPumpAdmin()
		anthrGlueCode.setupDemoScript('com.pumpco.iotaa.' + scriptToRun)
		anthrGlueCode.runSetupDemoScript()
		anthrGlueCode.setupDemoScriptComplete()
	}





}