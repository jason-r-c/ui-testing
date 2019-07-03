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

import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When


class TestPauseSystem {
	/**
	 * The step definitions below match with Katalon sample Gherkin steps
	 */

	/**
	 * @scenario 1:
	 * Navigate to the home screen
	 */

	@Given("I navigate to iotaa home")
	def navigate_to_home_pause_system() {
		WebUI.openBrowser('')
		WebUI.navigateToUrl('https://dev.cnect.to/iotaa')
	}

	@When("I then enter the username as (.*) and password as (.*)")
	def login_to_iotaa_home_pause_system(String username, String password) {
		WebUI.setText(findTestObject('CucumberTesting/LocalOfficeLogin/input_username_txt'), 'bristol.office')
		WebUI.setEncryptedText(findTestObject('CucumberTesting/LocalOfficeLogin/input_password_txt width6 heig'), '8SQVv/p9jVScEs4/2CZsLw==')
	}

	@Then("I click on iotaa login button")
	def click_login_button_pause_system() {
		WebUI.click(findTestObject('CucumberTesting/LocalOfficeLogin/button_sign in'))
	}

	@Then("I should see the iotaa home")
	def see_iotaa_home_pause_system() {
		//		WebUI.verifyElementVisible(findTestObject('CucumberTesting/LocalOfficeLogin/confirm_has_logged_in'))
		//		WebUI.delay(2)
	}

	/**
	 * @scenario 2:
	 * Pause the system scenario
	 */
	@Then("I then click on Admin tasks")
	def run_admin_tasks_pause_system() {
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/button_Admin tasks'))
	}

	@Then("I then click on Manage Hub State")
	def manage_hub_state_pause_system() {
		WebUI.selectOptionByValue(findTestObject('Object Repository/CucumberTesting/PauseSystem/select_Allocate NFC card to CA'), 'iotaa.form.manage.hub.state.localOffice', true)
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/button_next'))
	}

	@Then("I then click on John Jenkins")
	def select_john_jenkins_pause_system() {
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/p_John Jenkins 39 The Meadows'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/button_next'))
	}

	@Then("I then select Pause Hub")
	def select_pause_hub_pause_system() {
		WebUI.selectOptionByValue(findTestObject('Object Repository/CucumberTesting/PauseSystem/select_Pause hub'), 'pause', true)
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/button_next'))
	}

	@Then("I then select an End Time")
	def select_end_time_pause_system() {
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/select_end_time'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/i_Pick a Time_ico ico-caret'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/i_Pick a Time_ico ico-caret'))
		WebUI.delay(5)
		WebUI.setText(findTestObject('Object Repository/CucumberTesting/PauseSystem/input_Reason for pausing_txt'), 'test pausing functionality')
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/pause_system_next_button'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/pause_system_next_button'))
		WebUI.delay(5)
	}

	@Then("I then check pause status on the dashboard")
	def check_dashboard_pause_status_pause_system() {
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/img'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/div_Forename'))
	}

	/**
	 * @scenario 3:
	 * Unpause the system scenario
	 * 
	 * Note: we reuse some the functions from scenario 2
	 */

	@Then("I then select Unpause Hub")
	def select_unpause_hub_pause_system() {
		//WebUI.selectOptionByValue(findTestObject('Object Repository/Playground2/select_Unpause hub'), 'unpause', true)
		WebUI.selectOptionByValue(findTestObject('Object Repository/CucumberTesting/PauseSystem/select_Unpause hub'), 'unpause', true)
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/button_next'))
	}

	@Then("I then check unpaused status on the dashboard")
	def check_dashboard_unpaused_status_pause_system() {
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/img'))
		WebUI.click(findTestObject('Object Repository/CucumberTesting/PauseSystem/check_system_is_unpaused'))
	}
}