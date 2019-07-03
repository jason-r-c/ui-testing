package iotaaDashboardUtils

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.exception.StepErrorException
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

// @JC 15/4/19: Import the Step keywords
import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When

// @JC 15/4/19:
import iotaaDashboardUtils.Utilities as anthrUtils

// 15/4/19: debug output
import groovy.json.JsonOutput

public class familyApp_regressionTest {

	//	/**************************************************************************************************************
	//	 * Family App generic glue code
	//	 **************************************************************************************************************/
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: click back to Family App home screen. Description: the revealved button is now displayed
	//	 */
	//	@Given('from (.*) screen click back to Family App home screen')
	//	def clickBackToFamilyAppHomeScreen(String selectedPackage) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + selectedPackage + "']/p[text()='back']"
	//		def clickBack = new TestObject('clickBack')
	//		clickBack.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.click(clickBack)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: the (.*) screen is displayed. Description: checks that the screen is displayed
	//	 */
	//	@Given('the (.*) screen is displayed')
	//	def screenDisplayed(String screen) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + screen + "']"
	//		def appScreen = new TestObject('appScreen')
	//		appScreen.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.verifyElementVisible(appScreen)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: the (.*) app date selector is displayed. Description: the date range selector displayed for the screen defined
	//	 */
	//	@And('the (.*) app date selector is displayed')
	//	def appDateSelectorDisplayed(String screen) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + screen + "']/following-sibling::section/section[@class='app-date-selector']"
	//		def appDateSelector = new TestObject('appDateSelector')
	//		appDateSelector.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.verifyElementVisible(appDateSelector)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: (.*) data-lozenge displayed for (.*). Description: Check the defined package has the defined lozenge, ie, information, displayed
	//	 */
	//	@Given('(.*) data-lozenge displayed for (.*)')
	//	def packageDataLozengeDisplayed(String screen, String lozenge) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='" + screen + "']//section[@name='data-lozenge']/h3[text()='" + lozenge + "' ]"
	//		// -- //body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='hydration']//section[@name='data-lozenge']/h3[text()='day summary' ]
	//		def packageDataLozenge = new TestObject('packageDataLozenge')
	//		packageDataLozenge.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.verifyElementVisible(packageDataLozenge)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: (.*) activity graph button is displayed. Description: checks the view activity graph button is displayed
	//	 */
	//	@Given('(.*) activity graph button is displayed')
	//	def activityGraphButtonDisplayed(String selectedPackage) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='" + selectedPackage +  "']//button[contains( text(),'Activity Graph' )]"
	//		def activityGraphButton = new TestObject('activityGraphButton')
	//		activityGraphButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.verifyElementVisible(activityGraphButton)
	//	}
	//
	//	/**
	//	 * @anthropos-gherkin:
	//	 * Step: i click the (.*) package button. Description: clicks the defiend package button
	//	 */
	//	@Given('i click the (.*) package button')
	//	def clickSelectedPackageButton(String selectedPackage) {
	//		def xpathQuery = ''
	//		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, '" + selectedPackage + "') ]"
	//		def clickSelectedPackage = new TestObject('clickSelectedPackage')
	//		clickSelectedPackage.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
	//		WebUI.click(clickSelectedPackage)
	//	}

	/**************************************************************************************************************
	 * Family App generic glue code
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: click back to Family App home screen. Description: the revealved button is now displayed
	 */
	@Given('from (.*) screen click back to Family App home screen')
	def clickBackToFamilyAppHomeScreen(String selectedPackage) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + selectedPackage + "']/p[text()='back']"
		def clickBack = new TestObject('clickBack')
		clickBack.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickBack)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: the (.*) screen is displayed. Description: checks that the screen is displayed
	 */
	@Given('the (.*) screen is displayed')
	def screenDisplayed(String screen) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + screen + "']"
		def appScreen = new TestObject('appScreen')
		appScreen.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(appScreen)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: the (.*) app date selector is displayed. Description: the date range selector displayed for the screen defined
	 */
	@And('the (.*) app date selector is displayed')
	def appDateSelectorDisplayed(String screen) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header " + screen + "']/following-sibling::section/section[@class='app-date-selector']"
		def appDateSelector = new TestObject('appDateSelector')
		appDateSelector.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(appDateSelector)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: (.*) data-lozenge displayed for (.*). Description: Check the defined package has the defined lozenge, ie, information, displayed
	 */
	@Given('(.*) data-lozenge displayed for (.*)')
	def packageDataLozengeDisplayed(String screen, String lozenge) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='" + screen + "']//section[@name='data-lozenge']/h3[text()='" + lozenge + "' ]"
		// -- //body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='hydration']//section[@name='data-lozenge']/h3[text()='day summary' ]
		def packageDataLozenge = new TestObject('packageDataLozenge')
		packageDataLozenge.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(packageDataLozenge)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: (.*) activity graph button is displayed. Description: checks the view activity graph button is displayed
	 */
	@Given('(.*) activity graph button is displayed')
	def activityGraphButtonDisplayed(String selectedPackage) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='" + selectedPackage +  "']//button[contains( text(),'Activity Graph' )]"
		def activityGraphButton = new TestObject('activityGraphButton')
		activityGraphButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(activityGraphButton)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: i click the (.*) package button. Description: clicks the defiend package button
	 */
	@Given('i click the (.*) package button')
	def clickSelectedPackageButton(String selectedPackage) {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, '" + selectedPackage + "') ]"
		def clickSelectedPackage = new TestObject('clickSelectedPackage')
		clickSelectedPackage.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(clickSelectedPackage)
	}

	/**************************************************************************************************************
	 * Family App home page feature
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: the homeinstead.jpg logo is displayed. Description: Checks if the home screen logo is displayed in the UI
	 */
	@Given('the Family App logo is displayed')
	def checkFamilyAppLogoDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//*[@name='sub-header']/img"
		def logoDisplayed = new TestObject('logoDisplayed')
		logoDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(logoDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: info and settings buttons are displayed. Description: Checks the help and settings icons are diplsayed on the home screen header
	 */
	@Given('info and settings buttons are displayed')
	def checkInfoAndSettingsIcons() {
		helpIconDisplayed()
		settingsIconDisplayed()
	}

	def helpIconDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@data-bind, 'onClickHelp') ]"
		def settingsIconDisplayed = new TestObject('settingsIconDisplayed')
		settingsIconDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(settingsIconDisplayed)
	}

	def settingsIconDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@data-bind, 'onClickSettings') ]"
		def helpIconDisplayed = new TestObject('helpIconDisplayed')
		helpIconDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(helpIconDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: circle message is displayed. Description: Checks if the client status circle is displayed 
	 */
	@Given('circle message is displayed')
	def circleMessageDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='circles']"
		def familyAppCircleDisplayed = new TestObject('familyAppCircleDisplayed')
		familyAppCircleDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(familyAppCircleDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: circle message is displayed. Description: Checks if the client status circle is displayed
	 */
	@Given('alerts message is displayed')
	def alertsOnHomeScreenDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-alerts']"
		def alertsDisplayed = new TestObject('alertsDisplayed')
		alertsDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: x. Description: x
	 */
	@And('more button is displayed')
	def alertsMoreDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-alerts']//*[text()='more']"
		def alertsMoreButtonDisplayed = new TestObject('alertsMoreButtonDisplayed')
		alertsMoreButtonDisplayed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsMoreButtonDisplayed)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: alert text is displayed. Description: Checks if the alerts text is displayed on the home screen
	 */
	@And('alert text is displayed')
	def alertsTextDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-alerts']//p[contains(@data-bind, 'description') ]"
		def alertsText = new TestObject('alertsText')
		alertsText.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsText)
	}


	/**
	 * @anthropos-gherkin:
	 * Step: alert text is displayed. Description: Checks if the alerts text is displayed on the home screen
	 */
	@And('Hydration, Nutrition, Activity, Environment buttons are displayed')
	def x() {
		hydrationButtonDisplayed()
		movementButtonDisplayed()
		nutritionButtonDisplayed()
		safetyButtonDisplayed()
	}

	def hydrationButtonDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, 'hydration') ]"
		def hydrationButton = new TestObject('hydrationButton')
		hydrationButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(hydrationButton)
	}

	def movementButtonDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, 'hydration') ]"
		def movementButton = new TestObject('movementButton')
		movementButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(movementButton)
	}

	def nutritionButtonDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, 'hydration') ]"
		def nutritionButton = new TestObject('nutritionButton')
		nutritionButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(nutritionButton)
	}

	def safetyButtonDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-buttons']//div[contains( @class, 'hydration') ]"
		def safetyButton = new TestObject('safetyButton')
		safetyButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(safetyButton)
	}

	/**
	 * Alerts and AIs list
	 */

	@Given('alerts list title is displayed')
	def alertsListTitleDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@class, 'home-extras')]//p[text()='Alerts']"
		def alertsListTitle = new TestObject('alertsListTitle')
		alertsListTitle.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsListTitle)
	}

	@Given('alerts list summary is displayed')
	def alertsListSummaryDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@class, 'home-extras')]//p[contains(text(), 'acknowledged') ]"
		def alertsListSummary = new TestObject('alertsListSummary')
		alertsListSummary.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsListSummary)
	}

	@Given('actionable insights list title is displayed')
	def actionableInsightsListTitleDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@class, 'home-extras')]//p[text()='Alerts']"
		def actionableInsightsListTitle = new TestObject('actionableInsightsListTitle')
		actionableInsightsListTitle.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(actionableInsightsListTitle)
	}

	@Given('actionable insights list summary is displayed')
	def actionableInsightsListSummaryDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[contains(@class, 'home-extras')]//p[contains(text(), 'acknowledged') ]"
		def actionableInsightsListSummary = new TestObject('actionableInsightsListSummary')
		actionableInsightsListSummary.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(actionableInsightsListSummary)
	}


	/**************************************************************************************************************
	 * Family App alerts feature
	 **************************************************************************************************************/

	@Given('i click the more button on the alerts container')
	def clickAlertsMoreButton() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@class='home-alerts']//*[text()='more']"
		def alertsMoreButton = new TestObject('alertsMoreButton')
		alertsMoreButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(alertsMoreButton)
	}


	/**
	 * @anthropos-gherkin:
	 * Step: ATTENTION REQUIRED, TO BE ACTIONED and CLOSED separators are displayed. Description: Checks if all the alerts screen separators are displayed
	 */
	@Given('ATTENTION REQUIRED, TO BE ACTIONED and CLOSED separators are displayed')
	def checkAllSeparators() {
		attentionSeparatorDisplayed()
		toBeActionedSeparatorDisplayed()
		closedSeparatorDisplayed()
	}

	def attentionSeparatorDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header alerts']//following-sibling::section//label[contains(text(), 'Attention')]"
		def attentionSeparator = new TestObject('attentionSeparator')
		attentionSeparator.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(attentionSeparator)
	}

	def toBeActionedSeparatorDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header alerts']//following-sibling::section//label[contains(text(), 'Actioned')]"
		def attentionSeparator = new TestObject('attentionSeparator')
		attentionSeparator.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(attentionSeparator)
	}

	def closedSeparatorDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//section[@class='app-header alerts']//following-sibling::section//label[contains(text(), 'Closed')]"
		def attentionSeparator = new TestObject('attentionSeparator')
		attentionSeparator.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(attentionSeparator)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: uncollapse the first item listed under attention required. Description: Displays extra information when icon has been clicked
	 */	
	@Given('uncollapse the first item listed under attention required')
	def alertsAttentionRequiredItemDisplayed() {
		def xpathQuery = ''
		xpathQuery = "(//section[@class='app-header alerts']//following-sibling::section/div[ contains( @class, 'screen-alerts-group')][1]//div[contains( @class, 'comp-row-actions')])[1]/button"
		def alertsAttentionRequiredItem = new TestObject('alertsAttentionRequiredItem')
		alertsAttentionRequiredItem.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.click(alertsAttentionRequiredItem)
		// --  //section[@class='app-header alerts']//following-sibling::section//label[contains(text(), 'Attention')]/ancestor::span/following-sibling::div[contains(@class, 'screen-alerts-group')][1]//div[contains( @class, 'comp-row-actions')]//button
	}

	/**
	 * @anthropos-gherkin:
	 * Step: attention required alert message text is displayed. Description: Displays the first items' message text in the alerts screen
	 */
	@And('attention required alert message text is displayed')
	def alertsAttentionRequiredMessageDisplayed() {
		def xpathQuery = ''
		xpathQuery = "(//section[@class='app-header alerts']//following-sibling::section/div[ contains( @class, 'screen-alerts-group')][1]//div[contains( @class, 'comp-row-actions')])[1]/p[contains( @data-bind, 'description' )]"
		def alertsAttentionRequiredMessage = new TestObject('alertsAttentionRequiredMessage')
		alertsAttentionRequiredMessage.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsAttentionRequiredMessage)
	}

	/**
	 * @anthropos-gherkin:
	 * Step: ACKNOWLEDGE button is displayed. Description: the revealved button is now displayed
	 */
	@And('ACKNOWLEDGE button is displayed')
	def alertsAttentionRequiredAcknowledgedBtnDisplayed() {
		def xpathQuery = ''
		xpathQuery = "(//section[@class='app-header alerts']//following-sibling::section/div[ contains( @class, 'screen-alerts-group')][1]//div[contains( @class, 'comp-row-actions')])[1]//button[contains( text(), 'Acknowledge')]"
		def alertsAttentionRequiredAcknowledgedBtn = new TestObject('alertsAttentionRequiredAcknowledgedBtn')
		alertsAttentionRequiredAcknowledgedBtn.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(alertsAttentionRequiredAcknowledgedBtn)
	}


	/**************************************************************************************************************
	 * Family App Environment feature
	 **************************************************************************************************************/

	/**
	 * @anthropos-gherkin:
	 * Step: weather data-lozenge displayed for (.*). Description: Check the weather lozenge in the Environment screen is displayed or, concealed when no weather data is available 
	 */

	@And('data-lozenge weather displayed the safety screen')
	def envrionmentWeatherDataLozengeDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='safety']//section[contains( @data-bind, 'weather')]"
		// -- //body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='hydration']//section[@name='data-lozenge']/h3[text()='day summary' ]
		def envrionmentWeatherDataLozenge = new TestObject('envrionmentWeatherDataLozenge')
		envrionmentWeatherDataLozenge.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)

		// Checks if the weather data is available. if so, we can verify the element, if not, we can verify there is no card
		try {
			WebUI.verifyElementVisible(envrionmentWeatherDataLozenge)
		}
		catch(Exception e) {
			println '\r\r family app exception thrown is: ' + e + '\r\r'
			println 'this is most likely due to the waether forecast data being unavailable \r \r'
			def envrionmentWeatherDataLozengeConcealed = new TestObject('envrionmentWeatherDataLozengeConcealed')
			xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='safety']//section[contains( @data-bind, 'weather') and contains( @class,'concealed')] "
			envrionmentWeatherDataLozengeConcealed.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
			WebUI.verifyElementPresent(envrionmentWeatherDataLozengeConcealed,1)
			println 'however, we can confirm the weather lozenge is concealed \r \r '
		}
	}

	/**
	 * @anthropos-gherkin:
	 * Step: safety activity graph button is displayed. Description: checks the view temperature graph button is displayed
	 */
	@Given('safety temperature graph button is displayed')
	def temperatureGraphButtonDisplayed() {
		def xpathQuery = ''
		xpathQuery = "//body//div[@name='Iotaa.helperLandingPageSpace']//div[@name='safety']//button[contains( text(),'Temperature Graph' )]"
		def temperatureGraphButton = new TestObject('temperatureGraphButton')
		temperatureGraphButton.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
		WebUI.verifyElementVisible(temperatureGraphButton)
	}

	// ---- Test creating an xpath finder finder function here!!! ---- //




	// END class
}
