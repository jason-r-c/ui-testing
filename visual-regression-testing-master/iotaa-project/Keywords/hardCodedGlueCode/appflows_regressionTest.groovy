package hardCodedGlueCode
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

// @JC 18/4/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// JC 29/04/19: Import custom keywords
import iotaaDashboardUtils.Utilities as anthrUtils

class appflows_original {


	def anthrUtils = new anthrUtils()

	/**************************************************************************************************************
	 * Appflows
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * _Step:_ I select (.*) from the drop down list in the (.*) appflow. Description: Selects the desired drop down list item in the desired AppFlow.<br><br><strong>Example usage:</strong><br>I select Accept Installation Request from the drop down list in the Accept Hub Installation Request appflow<br>
	 */
	@And('I select (.*) from the drop down list in the (.*) appflow')
	def selectFromDropDownAppflow(String dropDownItem, String appflowName) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowName+"')]/ancestor::div[1]/following-sibling::div[2]//select"

		def dropDownAppflowObject = new TestObject('dropDownAppflowObject')
		dropDownAppflowObject.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownAppflowObject, dropDownItem, false)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step:_ I select (.*) from the drop down list in the (.*) appflow. Description: Selects the desired drop down list item in the desired AppFlow.<br><br><strong>Example usage:</strong><br>I select Accept Installation Request from the drop down list in the Accept Hub Installation Request appflow<br>
	 */
	@And('I select (.*) in the drop down list in the (.*) secondary appflow')
	def selectFromDropDownSecondaryAppflow(String dropDownItem, String appflowName) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'" + appflowName + "')]/ancestor::div[1]/following-sibling::div[3]//select"
		//body//div[@name='System.formSpace']//*[contains(text(),'" + appflowName + "')]/ancestor::div[1]/following-sibling::div[3]//option[text()='" + dropDownItem + "']

		def dropDownAppflowObject = new TestObject('dropDownAppflowObject')
		dropDownAppflowObject.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownAppflowObject, dropDownItem, false)
	}




	/**
	 * @anthropos-gherkin:
	 * _Step:_ I click next in the secondary (.*) appflow. Description: Clicks the next link in the desired appflow, in order to move to the next screen.<br><br><strong>Example usage:</strong><br>I click next in the Accept Hub Installation Request appflow
	 */
	@And('I click next for the (.*) secondary appflow')
	def selectNextSecondaryAppflow(String dropDownItem) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+dropDownItem+"')]/ancestor::div/ancestor::div//button[contains(text(), 'next')]"
		def selectNext = new TestObject('selectNext')
		selectNext.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectNext)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step:_ select (.*) in the main (.*) multi select form appflow. Description: selects the desired item in the multi select form appflow
	 */
	@And('select (.*) in the main (.*) multi select form appflow')
	def select_x_in_the_main_multi_select_form_appflow(String multiSelectFormItem, String multiSelectFormAppflow ) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'" + multiSelectFormAppflow + "')]/ancestor::div[1]/following-sibling::div//p[text()='" + multiSelectFormItem + "']"
		def selectItem = new TestObject('selectItem')
		selectItem.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectItem)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step:_ select (.*) in the secondary (.*) multi select form appflow. Description: selects the desired item in the multi select form appflow
	 */
	@And('select (.*) in the secondary (.*) multi select form appflow')
	def select_x_in_the_secondary_multi_select_form_appflow(String multiSelectFormItem, String multiSelectFormAppflow ) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'" + multiSelectFormAppflow + "')]/ancestor::div[1]//div[@data-name='select']/p[contains(text(), '" + multiSelectFormItem + "')]"
		def selectItem = new TestObject('selectItem')
		selectItem.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectItem)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step_: x. Description: x
	 */
	@And('input (.*) text into Enter date & time to pause Hub appflow')
	def input_x_text_into_date_and_time_appflow(String inputText) {
		def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'pause Hub')]/ancestor::div[1]/following-sibling::div[5]//input"
		def inputField = new TestObject('inputField')
		inputField.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.setText(inputField, inputText)
	}

	/**
	 * @anthropos-gherkin:
	 * _Step:_ I ensure that client is moved into (.*). Description: (**NOTE: This Step needs reworking) Ensures that a card has been moved from one to the desired column.<br><br><strong>Example usage:</strong><br>I ensure that client is moved into My Install Requests
	 */
	@And('I ensure that client is moved into (.*)')
	def checkRequestStatus(String cardName) {
		def checkRequestStatus = new TestObject('checkRequestStatus')
		checkRequestStatus.addProperty("xpath", ConditionType.EQUALS,
				"(//*[contains(text(),'" + cardName  +"')]/ancestor::div[2]/iotaa-actions-card[1])", true)
		// -- (//*[contains(text(),'My Install Requests')]/ancestor::div[2]/iotaa-actions-card[1])
		WebUI.waitForElementVisible(checkRequestStatus, 2)
	}

	
	// -- //*[contains(@name,'scenarios_row00_enabled')]//*[contains(@class, 'button')]
	/**
	 * @anthropos-gherkin:
	 * _Step:_ 
	 */
	@And('check checkbox for First Morning Activity - no activity alert')
	def i_check_the_first_morning_activity_no_activity_alert_checkbox() {
		def xpathQuery = " //*[contains(@name,'scenarios_row00_enabled')]//*[contains(@class, 'button')] "
		def checkBoxElement = new TestObject('checkBoxElement')
		checkBoxElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.waitForElementVisible(checkBoxElement, GlobalVariable.G_Timeout)
	}




}