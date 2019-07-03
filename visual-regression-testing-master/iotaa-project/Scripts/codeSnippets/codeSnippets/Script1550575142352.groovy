import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable

// ### jason c custom imports ### //

// Packages for getting the browser name and using native selenium commands
import com.kms.katalon.core.webui.driver.DriverFactory as DF
import com.thoughtworks.selenium.webdriven.WebDriverBackedSelenium

println '\n ### RUNNING openBrowserWindow() ###'

/**
 *  Open the web browser
 */
@Keyword
def openBrowserWindow() {
	CustomKeywords.'iotaaDashboardUtils.Utilities.openWebBrowser'()
	
	// Lets open a browser so we can start the test case
	WebUI.navigateToUrl('https://dev.cnect.to/iotaa')
}
openBrowserWindow()

println '### \n RUNNING runSeleniumCommands() ###'

@Keyword
def runSeleniumCommands() {
	println 'DF.getExecutedBrowser() returns the name of the web browser, and its: ' + DF.getExecutedBrowser()
	
	def driver = DF.getWebDriver()
	println 'driver is: '+driver	
	String baseUrl = "https://dev.cnect.to/iotaa"
	
	def selenium = new WebDriverBackedSelenium(driver, baseUrl)
	println 'selenium object is: '+selenium
	
	selenium.click("//input[@type='text']")	
	
	// You can use css selectors to find the username field such as below:
	// selenium.click("css=.form-element.form-username.form-textValue input")
	
	selenium.type("//input[@type='text']", 'bristol.office')
	selenium.type("//input[@type='password']", 'password')
	selenium.click("//div[@id='appflow']/div[3]/div[3]/button")
}
runSeleniumCommands()

println '### \n RUNNING convertObjectToString() ###'

@Keyword
def convertObjectToString() {
	// Get the browser as an object
	def theBrowser = DF.getExecutedBrowser()
	
	// Convert object to string so we can use in the if condition
	def browserStringify = theBrowser.toString()

	// Check if browserStrinify is a string
	if( browserStringify instanceof String ) {
		println browserStringify + ' is a string'
	} else {
		println 'not a string'

	}
}
convertObjectToString()

println '### \n RUNNING splitUrl() ###'

@Keyword
def splitUrl() {
	def url = WebUI.getUrl()
	println 'The current url split is: ' + url.split('/')
}
splitUrl()