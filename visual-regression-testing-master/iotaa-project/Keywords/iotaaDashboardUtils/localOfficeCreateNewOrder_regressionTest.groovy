package iotaaDashboardUtils
import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory
import com.kms.katalon.core.exception.StepErrorException
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

// Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// JC7/5/19: Import appflows.groovy class
import reusableGlueCode.appflows as anthrAppflows

class localOfficeCreateNewOrder_regressionTest {
	
	def anthrAppflows = new anthrAppflows()

	/**************************************************************************************************************
	 * Create Anthropos Order > Appflow
	 **************************************************************************************************************/

	// Appflow specific path
	def baseXpath = "//div[contains( @class, 'iotaa-form-preinstall-homeSurvey-internal' ) ]//div[contains( @class, 'form-screen' ) ]"
	// iotaa-form-preinstall-homeSurvey-internal

	// ## An example use of using baseXpath property
	//	@Given('I enter Ferrari in the Surname field in the Anthropos Order appflow')
	//	def x() {
	//		def xpathQuery = baseXpath + "//div[@class='appflow-panel']//div[contains( @class, 'form-surname' ) ]//input"
	//		def textToInput = 'Ferrari'
	//		def inputField = new TestObject('inputField')
	//		inputField.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.setText(inputField, textToInput)
	//	}


	@Given('_choose Monthly fee from How will the client be dropdown')
	def _choose_monthly_fee_from_how_will_the_client_be_dropdown() {
		def xpathQuery = baseXpath + "//div[3]//div[contains( @class, 'form-billing_row00_deviceCharges' ) ]//select"
		def selectItem = 'Monthly fee'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@Given('_choose Anthropos from Who will be performing the installation dropdown')
	def _choose_anthropos_from_who_will_be_performing_the_installation_dropdown() {
		def xpathQuery = baseXpath + "//div[3]//div[contains( @class, 'form-billing_row00_installationBy' ) ]//select"
		def selectItem = 'Anthropos'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@Given('_choose One-off charge from How will the client be charged dropdown')
	def _choose_one_off_charge_from_how_will_the_client_be_charged_dropdown() {
		def xpathQuery = baseXpath + "//div[3]//div[contains( @class, 'form-billing_row00_installCharges' ) ]//select"
		def selectItem = 'One-off charge'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	// ## Standard devices appflow screen ## //

	@Given('_choose Hallway from Front door sensor dropdown in Standard Devices appflow')
	def _choose_hallway_from_front_door_sensor_dropdown_in_standard_devices_appflow() {
		// -- //div[contains( @class, 'iotaa-form-preinstall-homeSurvey-internal' ) ]//div[contains( @class, 'form-screen' ) ]//p[contains( text(), 'Front door sensor')]//ancestor::div[contains(@class,'td')]/following-sibling::div//select

		def xpathQuery = baseXpath + "//p[contains( text(), 'Front door sensor')]//ancestor::div[contains(@class,'td')]/following-sibling::div//select"
		def selectItem = 'Hallway'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@Given('_choose Kitchen from Back door sensor dropdown in the Door Sensors appflow')
	def _choose_kitchen_from_back_door_sensor_dropdown_in_the_door_sensors_appflow() {
		// -- //div[contains( @class, 'iotaa-form-preinstall-homeSurvey-internal' ) ]//div[contains( @class, 'form-screen' ) ]//p[contains( text(), 'Back door sensor')]//ancestor::div[contains(@class,'td')]/following-sibling::div//select

		def xpathQuery = baseXpath + "//p[contains( text(), 'Back door sensor')]//ancestor::div[contains(@class,'td')]/following-sibling::div//select"
		def selectItem = 'Kitchen'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@Given('_choose Add new Family App User from Choice dropdown in Current Family App Users appflow')
	def _choose_add_new_family_app_user_from_choice_dropdown_in_current_family_app_users_appflow() {
		// -- //*[contains(text(),'Current Family App Users:')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Choice' ) ]//following-sibling::select

		def xpathQuery = baseXpath + "//*[contains(text(),'Current Family App Users:')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Choice' ) ]//following-sibling::select"
		def selectItem = 'Add new Family App User'
		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	// ## current family app users appflow screen ## //

	@And('_choose Continue from Choice dropdown in Current Family App Users appflow')
	def _choose_continue_from_choice_dropdown_in_current_family_App_users_appflow() {
		// -- //body//div[@name='System.formSpace']//*[contains(text(),'Current Family App Users')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Choice' ) ]//following-sibling::select
		def xpathQuery = baseXpath+"//*[contains(text(),'Current Family App Users')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Choice' ) ]//following-sibling::select"
		def selectItem = 'Continue'

		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	// ## Who will receive alerts and actionable insights ## //

	@And('_choose Family App via Alerts during office hours droplist in the Who will receive alerts and actionable insights appflow')
	def _choose_family_app_via_alerts_during_office_hours_droplist_in_the_who_will_receive_alerts_and_actionable_insights_appflow() {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'Who will receive alerts and actionable insights')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), 'Alerts during office hours' ) ]//following-sibling::select"
		def selectItem = 'Family App'

		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@And('_choose Family App via Alerts out of office hours droplist in the Who will receive alerts and actionable insights appflow')
	def _choose_family_app_via_alerts_out_of_office_hours_droplist_in_the_who_will_receive_alerts_and_actionable_insights_appflow() {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'Who will receive alerts and actionable insights')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), 'Alerts out of office hours' ) ]//following-sibling::select"
		def selectItem = 'Family App'

		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}

	@And('_choose Family App via Actionable Insights droplist in the Who will receive alerts and actionable insights appflow')
	def asdf() {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'Who will receive alerts and actionable insights')]/ancestor::div[1]/following-sibling::div[3]//label[contains( text(), 'Actionable Insights' ) ]//following-sibling::select"
		def selectItem = 'Family App'

		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, selectItem, false)
	}
	
	// JC 7/5/19: Handle 'half-created' order
	@Given('_create new order if an order already exists')
	def _create_new_order_if_an_order_already_exists() {		
		try {		
			println "Entered Create new order try statement \r\r"		
			def xpathQuery = "//p[contains( text(), 'Select existing order to continue, or create new order')]"	 		
			def preExistingOrderElement = new TestObject('preExistingOrderElement')		
			preExistingOrderElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			// JC 7/5/19: On a clean run this will pass with no element found. When running manually with in progress orders, this will fail and fall through
			// to the exception block
			def booleanVal = WebUI.verifyElementNotPresent(preExistingOrderElement, GlobalVariable.G_Timeout)			
			println "pre existing text found? : " + booleanVal + "\r\r"						
		} catch(Exception e) {
			println "\r\r Exception thrown and caught: " + e + "\r\r"			
			anthrAppflows.i_select_x_from_the_x_drop_down_list('Create new order', 'Order')
			println "\r\r Script just selected Create new order from drop down"			
			anthrAppflows.i_click_next()
			println "\r\r Script just clicked next to go to Create new order screen"
		}
		
		
	}
}