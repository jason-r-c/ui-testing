import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
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

import iotaaDashboardUtils.glueCode

// Xpath includes
import javax.xml.parsers.DocumentBuilder
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.xpath.XPath
import javax.xml.xpath.XPathConstants
import javax.xml.xpath.XPathExpression
import javax.xml.xpath.XPathFactory
import org.w3c.dom.Document
import org.w3c.dom.NodeList

// Jsoup includes
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
// import static org.assertj.core.api.Assertions.*
import us.codecraft.xsoup.Xsoup

import groovy.json.JsonOutput

/**
 * Goal of the unit tests:
 * - We test our expected input against our output.
 */

/**************************************************************************************************************************
 * 27/6/19
 * Unit test one: Test our expected xpath queries are found in the xpathGenerator() function.
 * @author jasoncarney
 *
 *************************************************************************************************************************/
def glueCode = new glueCode()

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
	installationTableManageBtn: "//*[@data-ui-test='aos.component.csvtable']//*[@data-ui-test='aos.action.link']",
	fred: 'fail'	
]

xpathCollection.each{ key, value -> 
	def result = glueCode.xpathGenerator(key)

	if(result == value) {
		println key+' - PASSED!!'
	} else {
		println key+' - FAILED!!'
	}
}

/**************************************************************************************************************************
 * 27/6/19
 * Unit test two: Test our expected html elements are found in the local office dashboard.
 * @author jasoncarney
 *
 *************************************************************************************************************************/

// create a new array containg key value pairs where the value is the html element
def htmlCollection = [
		headerBackBtn: '<button name="back" disabled="" class="btn btn-background"> <span class="ico-ios7 ico-back-inv"></span> </button>'
	]

File input = new File("/Users/jasoncarney/repository/anthropos-test-html/franchiseLoggedinDashboard.html");
Document document = Jsoup.parse(input, "UTF-8", "");

// iterate over html colleciton
htmlCollection.each{ key, value ->
	
	// Get the xpath value returned
	def xpath = glueCode.xpathGenerator(key)

	// Handles unexpected input, ie, fred: false
	try {
		// Use each xpath query against the external html, and return the html element
		result = Xsoup.compile(xpath).evaluate(document).list()
	} catch(Exception ex) {
         println("Catching the exception");
	}
	
	// Cover all logic paths
	if(result.size() == 1) {		
		// Compare our html element against the returned html
		if(result[0] == value) {
			 println '\r PASSED!!'			 
		} else {
			println '\r FAILED!!'
			println '\r contents of result[0]: '+result[0]
			println '\r contents of value: '+value
		}

	} else {	
		println '\r FAILED!!'	
		println '\r '+result.size()+' match/s found'
	}
}

