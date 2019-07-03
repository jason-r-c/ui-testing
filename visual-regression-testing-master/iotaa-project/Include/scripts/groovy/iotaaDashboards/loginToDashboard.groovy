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


class loginToDashboard {
	/**
	 * The step definitions below match with Katalon sample Gherkin steps
	 */
	@Given("I go to iotaa home")
	def go_to_dashbard() {
		WebUI.openBrowser('')
		WebUI.navigateToUrl('https://iotaa-test.anthropos.io/anthropos')
	}

	@When("Enter the username as (.*) and password as (.*)")
	def enter_credentials(String username, String password) {
		WebUI.setText(findTestObject('CucumberTesting/LocalOfficeLogin/input_username_txt'), 'bristol.office')
		WebUI.setEncryptedText(findTestObject('CucumberTesting/LocalOfficeLogin/input_password_txt width6 heig'), '8SQVv/p9jVScEs4/2CZsLw==')
	}

	@Then("I click iotaa login button")
	def click_signin() {
		WebUI.click(findTestObject('CucumberTesting/LocalOfficeLogin/button_sign in'))
	}

	@Then("I should see iotaa home")
	def see_dashboard_home() {
		//		WebUI.verifyElementVisible(findTestObject('CucumberTesting/LocalOfficeLogin/confirm_has_logged_in'))
		//		WebUI.delay(2)
	}
}