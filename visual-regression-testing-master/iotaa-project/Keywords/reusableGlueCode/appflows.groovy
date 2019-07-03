package reusableGlueCode

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
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

// @JC 18/4/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// JC 29/04/19: Import custom keywords
import iotaaDashboardUtils.Utilities as anthrUtils

public class appflows {

	def anthrUtils = new anthrUtils()

	// JC 2/5/19: selectNextAppflow function needs to be refactored so to remove the appflow title dependency.
	// it also needs to have the function renamed to use underscores.
	/**
	 * @anthropos-gherkin:
	 * _Step:_ I click next in the (.*) appflow. Description: Clicks the next link in the desired appflow, in order to move to the next screen.<br><br><strong>Example usage:</strong><br>I click next in the Accept Hub Installation Request appflow
	 */
	@And('I click next in the (.*) appflow')
	def selectNextAppflow(String dropDownItem) {
		def selectNext = new TestObject('selectNext')

		dropDownItem = dropDownItem.toLowerCase()

		def xpathQuery = "(//*"+anthrUtils.xpathToLower(dropDownItem)+"/ancestor::div/ancestor::div//button[contains(text(), 'next')])"

		selectNext.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		WebUI.click(selectNext)
	}

	// JC 3/5/19
	/**
	 * @anthropos-gherkin:
	 * Step: I click next. Description: Use this step for clicking next button/link in an appflow.
	 */
	@And('I click next')
	def i_click_next() {
		def selectNext = new TestObject('selectNext')
		def xpathQuery = "//button[contains(text(), 'next') and contains(@class, 'action-next')]"
		selectNext.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectNext)
	}

	/** @anthropos-gherkin:
	 * Step: I enter (.*) in the (.*) field. Description: Use this step for entering values into input fields. <br><br><strong>Example usage:</strong><br>I enter Ferrari in the Surname field
	 */
	@Given('I enter (.*) in the (.*) field')
	def i_enter_x_in_the_x_field(String inputValue, String inputField) {
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+ appflowScreen +"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+ inputField +"' ) ]/following-sibling::input"
		// -- //label[contains( text(), 'Surname' ) ]/following-sibling::input

		// JC 1/5/19: leaner xpath
		def xpathQuery = "//label[contains( text(), '"+inputField+"' ) ]/following-sibling::input"

		def inputFieldObect = new TestObject('inputFieldObect')
		inputFieldObect.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.setText(inputFieldObect, inputValue)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I select (.*) from the (.*) drop down list. Description: Use this step for selecting values from drop down lists.<br><br><strong>Example usage:</strong><br>I select Accept Installation Request from the drop down list<br>
	 */
	@And('I select (.*) from the (.*) drop down list')
	def i_select_x_from_the_x_drop_down_list(String dropDownItem, String dropDownLabel) {
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowName+"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::select"
		//--  //body//div[@name='System.formSpace']//*[contains(text(),'General Information')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), 'Gender' ) ]//following-sibling::select

		def xpathQuery = "//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::select"

		def dropDownElement = new TestObject('dropDownElement')
		dropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dropDownElement, dropDownItem, false)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I enter (.*) (.*) (.*) in the (.*) datepicker drop down list. Description: Use this step for selecting aOS styled date selector elements.<br><br><strong>Example usage:</strong><br>I enter 01 jan 1945 in the Date of Birth datepicker drop down list<br>
	 */
	@And('I enter (.*) (.*) (.*) in the (.*) datepicker drop down list')
	def i_enter_x_in_the_x_datepicker_drop_down_list(String day, String month, String year, String dropDownLabel) {
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowName+"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'dd' ) ]"
		//--  //body//div[@name='System.formSpace']//*[contains(text(),'General Information')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), 'Date of Birth' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'dd' ) ]

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'dd' ) ]"

		println "day entered in gherkin is: " + day
		println "month entered in gherkin is: " + month
		println "year entered in gherkin is: " + year

		def dayDropDownElement = new TestObject('dayDropDownElement')
		dayDropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(dayDropDownElement, day, false)

		// xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowName+"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'mm' ) ]"
		// JC 1/5/19: leaner xpath query
		xpathQuery = "//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'mm' ) ]"

		def monthDropDownElement = new TestObject('monthDropDownElement')
		monthDropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(monthDropDownElement, month, false)

		// xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowName+"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'yy' ) ]"
		// JC 1/5/19: leaner xpath query
		xpathQuery = "//label[contains( text(), '"+dropDownLabel+"' ) ]//following-sibling::div/date-picker//select[contains( @data-bind, 'yy' ) ]"

		def yearDropDownElement = new TestObject('yearDropDownElement')
		yearDropDownElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(yearDropDownElement, year, false)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I enter (.*) in the (.*) text area. Description: Use this step for entering values into text area fields.<br><br><strong>Example usage:</strong><br>I enter additional information in the Installation Day Notes text area
	 *
	 */
	@Given('I enter (.*) in the (.*) text area')
	def i_enter_x_in_the_x_text_area(String textAreaValue, String textAreaLabel) {
		// -- //body//div[@name='System.formSpace']//*[contains(text(),'General')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), 'Installation Day Notes' ) ]/following-sibling::textarea
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+ appflowScreen +"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+ textAreaField +"' ) ]/following-sibling::textarea"

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//label[contains( text(), '"+textAreaLabel+"' ) ]/following-sibling::textarea"

		def textAreaElement = new TestObject('textAreaElement')
		textAreaElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.setText(textAreaElement, textAreaValue)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I check the (.*) checkbox. Description: Use this step for checking aOS styled checkboxes.<br><br><strong>Example usage:</strong><br>I check the Please tick the box to confirm acceptance checkbox
	 *
	 */
	// I check the Please tick the box to confirm acceptance. checkbox in the Broadband appflow
	@Given('I check the (.*) checkbox')
	def i_check_the_x_checkbox_in_the_x_appflow(String checkBoxLabel) {
		// -- //body//div[@name='System.formSpace']//*[contains(text(),'Broadband')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), 'Please tick the box to confirm acceptance' ) ]/following-sibling::div/button
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowScreen+"')]/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+checkBoxLabel+"' ) ]/following-sibling::div/button"

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//label[contains( text(), '"+checkBoxLabel+"' ) ]/following-sibling::div/button"

		def checkBoxElement = new TestObject('checkBoxElement')
		checkBoxElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(checkBoxElement)
	}

	// JC 2/5/19: i_select_the_x_selectable_item_in_the_x_appflow glue code function can be refactored
	// i need to remove the appflow screen title dependency.
	/**
	 * @anthropos-gherkin:
	 * Step: I select the (.*) selectable item in the (.*) appflow. Description: Use this step for selecting aOS styled single item selects.<br><br><strong>Example usage:</strong><br>I select the Customer selectable item in the Select customer appflow
	 *
	 */
	@Given('I select (.*) from the (.*) selectable items in the (.*) appflow')
	def i_select_the_x_selectable_item_in_the_x_appflow(String selectableItem, String selectableItemLabel, String appflowScreen) {
		selectableItem = selectableItem.toLowerCase()
		// -- //body//div[@name='System.formSpace']//*[contains(text(),'"+appflowScreen+"')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), '"+selectableItemLabel+"' ) ]/following-sibling::div//p[contains("+xpathToLowerCase "+'selectableItemLabel+')] ]
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'"+appflowScreen+"')]/ancestor::div[1]/following-sibling::div[1]//label[contains( text(), '"+selectableItemLabel+"' ) ]/following-sibling::div//p"+anthrUtils.xpathToLower(selectableItem)

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//label[contains( text(), '"+selectableItemLabel+"' ) ]/following-sibling::div//p"+anthrUtils.xpathToLower(selectableItem)

		def selectableItemElement = new TestObject('selectableItemElement')
		selectableItemElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectableItemElement)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I confirm (.*) is visible. Description: Use this step for checking a screen is visible / displayed.<br><br><strong>Example usage:</strong><br>I confirm Finished is visible
	 */
	@Given('I confirm (.*) is visible')
	def i_check_the_x_appflow_screen_is_visible(String textToCheck) {
		textToCheck = textToCheck.toLowerCase()
		// def xpathQuery = "//body//div[@name='System.formSpace']//*"+anthrUtils.xpathToLower(appflowScreen)
		//body//*[contains(text(),'Finished')]

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//body//*"+anthrUtils.xpathToLower(textToCheck)

		def textToCheckElement = new TestObject('textToCheckElement')
		textToCheckElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(textToCheckElement)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I add (.*) (.*) number in the (.*) telephone field. Description: Use this step for entering a telephone number (which uses 5 numbers for the first segment and 6 numbers for the second segment).<br><br><strong>Example usage:</strong><br>I add 01234 567890 number in the Mobile Number telephone field
	 */
	@Given('I add (.*) (.*) number in the (.*) telephone field')
	def i_add_x_x_number_in_the_x_telephone_field(String telephoneSegmentOne, String telephoneSegmentTwo, String telephoneLabel) {
		// def xpathQuery = "//body//div[@name='System.formSpace']//*"+appflowScreen+"/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+telephoneLabel+"' ) ]/following-sibling::phone-number//input[1]"

		// JC 1/5/19: leaner xpath query
		def xpathQuery = "//label[contains( text(), '"+telephoneLabel+"' ) ]/following-sibling::phone-number//input[1]"
		def telephoneSegmentOneElement = new TestObject('telephoneSegmentOneElement')
		telephoneSegmentOneElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.setText(telephoneSegmentOneElement, telephoneSegmentOne)

		//xpathQuery = "//body//div[@name='System.formSpace']//*"+appflowScreen+"/ancestor::div[1]/following-sibling::div[2]//label[contains( text(), '"+telephoneLabel+"' ) ]/following-sibling::phone-number//input[2]"
		// JC 1/5/19: leaner xpath query
		xpathQuery = "//label[contains( text(), '"+telephoneLabel+"' ) ]/following-sibling::phone-number//input[2]"
		def telephoneSegmentTwoElement = new TestObject('telephoneSegmentTwoElement')
		telephoneSegmentTwoElement.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.setText(telephoneSegmentTwoElement, telephoneSegmentTwo)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: I select (.*) in the (.*) multi select list. Description: Use this step for selecting an item in a multi select list. <br><br><strong>Example usage:</strong><br>I select John Ferrari in the Client multi select list
	 */
	@And('I select (.*) in the (.*) multi select list')
	def select_x_in_the_main_multi_select_form_appflow(String multiSelectFormItem, String multiSelectFormLabel ) {
		// def xpathQuery = "//body//div[@name='System.formSpace']//*[contains(text(),'" + multiSelectFormAppflow + "')]/ancestor::div[1]/following-sibling::div//p[text()='" + multiSelectFormItem + "']"


		def xpathQuery = "//label[contains(text(),'"+multiSelectFormLabel+"')]/ancestor::div[1]//following-sibling::div//p[contains(text(),'"+multiSelectFormItem+"')]"

		def selectItem = new TestObject('selectItem')
		selectItem.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(selectItem)
	}

	/**************************************************************************************************************
	 * ## Sidebar Appflows (All Available Tasks and All Available Reports)
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: I select (.*) from the drop down list in the sidebar appflow for All Available (.*). Description: Use this step for selecting a drop down item from the All Available tasks / reports in the dashboard sidebar.<br><br><strong>Example usage:</strong><br>I select Manage Hub State from the drop down list in the sidebar appflow for All Available Tasks
	 */
	@Given('I select (.*) from the drop down list in the sidebar appflow for All Available (.*)')
	def i_select_x_from_the_drop_down_list_in_the_sidebar_appflow_for_all_available_x(String dropDownItem, String sidebarAppflow) {
		def xpathQuery = "//body//div[@name='Iotaa.localOfficeLandingPageSpace']/div[@name='Iotaa.localOfficeLandingPageLeftCog']//p[contains(text(), '"+ sidebarAppflow +"')]/following-sibling::div[1]//select"
		def sideBarDropDown = new TestObject('sideBarDropDown')
		sideBarDropDown.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.selectOptionByLabel(sideBarDropDown, dropDownItem, false)
	}

	@And('I click Run (.*) in the All Available (.*) appflow')
	def i_click_run_x_in_the_all_available_x_appflow(String runButton, String sidebarAppflow) {
		// -- //body//div[@name='Iotaa.localOfficeLandingPageSpace']/div[@name='Iotaa.localOfficeLandingPageLeftCog']//p[contains(text(), 'All Available Tasks')]/following-sibling::div[1]//button[contains(text(), 'Run Task')]
		def xpathQuery = "//body//div[@name='Iotaa.localOfficeLandingPageSpace']/div[@name='Iotaa.localOfficeLandingPageLeftCog']//p[contains(text(), 'All Available "+ sidebarAppflow +"')]/following-sibling::div[1]//button[contains(text(), 'Run "+ runButton +"')]"
		def runButtonSidebarAppflow = new TestObject('runButtonSidebarAppflow')
		runButtonSidebarAppflow.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(runButtonSidebarAppflow)
	}



}
