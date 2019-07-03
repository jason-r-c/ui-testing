// save to: visual-regression-testing/iotaa-project/Include/scripts/groovy/junittutorial/GreeterTest.groovy

package unitTests

import static org.hamcrest.CoreMatchers.*
import static org.junit.Assert.*

import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

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


// JCARNEY custom imports
import internal.GlobalVariable
import iotaaDashboardUtils.glueCode as anthrGlueCode
import java.util.regex.Pattern
import groovy.json.JsonOutput


@RunWith(JUnit4.class)
class unitTests {

	/*******************************************************************************************
	 * Anthropos unit test code
	 *******************************************************************************************/

	// Instantiate class wide objects for general use throughout unit tests
	def anthrGlueCode = new anthrGlueCode()

	// * Seems to be a faily decent example of a Unit test, as theres not much going on other than
	// opening a browser and checking a url exists.
	// Assert that there is url returned (pretty much guarnteeing that we have
	// successfully opened up a browser and navigated to one of our environments

	// Commented out so not run during development
	/*	 @Test
	 void navigateToEnvironment() {
	 logFnName('navigateToEnvironment')
	 def url = anthrGlueCode.navigateToEnvironment()
	 println '\r url is: '+url+'\r'
	 def pattern = ~/(?:http|https):\/\/((?:[\w-]+)(?:\.[\w-]+)+)(?:[\w.,@?^=%&amp;:\/~+#-]*[\w@?^=%&amp;\/~+#-])?/
	 def isMatch = pattern.class == Pattern
	 Boolean expected = true
	 Boolean actual = isMatch
	 assertThat(actual, is(expected))
	 logFnReturnValue(actual)
	 anthrGlueCode.confirm_feature_is_complete()
	 }
	 */


	// * Seems to be more of an Integration test as we are doing quite a few things in this test.
	// Confirm we can signout of the application

	// Commented out so not run during development
	/*	 @Test
	 void assertLoggedOut() {
	 logFnName("assertLoggedOut")
	 anthrGlueCode.x_login_with_x('', 'bristol.office')
	 anthrGlueCode.click_more_actions_menu()
	 Boolean expected = true
	 Boolean actual = anthrGlueCode.signout_of_application()
	 assertThat(actual, is(expected))
	 logFnReturnValue(actual)
	 anthrGlueCode.confirm_feature_is_complete()
	 }
	 */

	// Uses glueCode.groovy > signout_of_application()
	// Commented out so not run during development
	// 1) did we create a string for the xpath query
	/*	 @Test
	 void assertXpathQueryCreated() {
	 logFnName("assertXpathQueryCreated")
	 def xpathQuery = "//div[contains(@class,'header-more')]//button[contains(text(), 'signout')]"
	 String value = anthrGlueCode.isValidXpathQuery(xpathQuery)
	 // println  '\r value is:'+value+'\r'
	 Boolean expected = true
	 Boolean actual = value instanceof String
	 logFnReturnValue(actual)
	 assertThat(actual, is(expected))
	 }
	 */
	// 2) did we create an object of type test
	/*	@Test
	 void assertTestObjectCreated() {
	 logFnName("createTestObject")
	 def obj = anthrGlueCode.createTestObject('aTestObject')
	 Boolean expected = true
	 Boolean actual = obj instanceof TestObject
	 logFnReturnValue(actual)
	 assertThat(actual, is(expected))
	 }
	 */

	// 3) did we add a property to the object
	/*	@Test
	 void assertXpathPropertyAddedToTestObject() {
	 logFnName("assertXpathPropertyAddedToTestObject")
	 def obj = anthrGlueCode.createTestObject('aTestObject')
	 def xpathQuery = "//div[contains(@class,'header-more')]//button[contains(text(), 'signout')]"
	 def xpathPropertyAddedToObj = anthrGlueCode.xpathPropertyAddedToTestObject(obj, xpathQuery)
	 def prop = xpathPropertyAddedToObj["properties"].name
	 prop = prop.join(",")
	 Boolean actual
	 if(prop == 'xpath') {
	 actual = true
	 }
	 Boolean expected = true
	 logFnReturnValue(actual)
	 assertThat(actual, is(expected))
	 }
	 */

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// try to write unit tests for smaller parts of the software
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// an example function to refer to: normaliseDashboard(), navigateToEnvironment()
	// 1) did we call a function
	//
	// an example function to refer to: checkCardDisplayed()
	// 1) did we create an array
	//
	// an example function to refer to: collapse_x_container()
	// 1) did we lowercase a string
	// 2) did we replace spaces with no spaces
	//
	// an example function to refer to: def anthrUtils = new anthrUtils()
	// 1) did we create an instance of a class


	/*******************************************************************************************
	 * Anthropos logging functions
	 *******************************************************************************************/

	def logFnName(String fnName) {
		println '\r########################################################################'
		println '// Unit test function is: '+fnName+'()'
		println '########################################################################\r \r'
	}

	def logFnReturnValue(Boolean actual) {
		println '\rreturn value is: '+actual+'\r\r'
	}

	/*******************************************************************************************
	 * Example assertion code from kazayryam
	 ********************************************************************************************/

	//	@Test
	//	void testGreet() {
	//		String expected = "Hello, world"
	//		String actual = Greeter.greet("world")
	//		assertThat(actual, is(expected))
	//	}

	/**
	 * this will fail, intentionally for demonstration purpose
	 */
	//	@Test
	//	void testGreet_intensionalFailure() {
	//		String expected = "Goodnight, Man"
	//		String actual = Greeter.greet("Man")
	//		assertThat(actual, is(expected))
	//

	/*******************************************************************************************
	 * An area where i can add code for testing stuff out :D
	 ********************************************************************************************/

	//	@Test
	//	void testingPlayground() {
	//		// 1) assert global variable is a string
	//		// println '\r GlobalVariable.G_SiteURL is: ' + GlobalVariable.G_SiteURL + '\r'
	//		// assert GlobalVariable.G_SiteURL instanceof String
	//
	//		// 2) assert that global variable is one of the following
	//		// - dev.cnect.to
	//		// - demo.test.anthropos.io
	//		// - integration.aws.anthropos.io
	//		// - homeinstead.anthropos.io/anthropos
	//		// - upgrade.test.anthropos.io
	//		// - nightly.test.anthropos.io
	//		// - iotaa-at.anthropos.io/anthropos
	//
	//		//		def obj = [
	//		//			dev: 'dev.cnect.to',
	//		//			demo: 'demo.test.anthropos.io'
	//		//		]
	//		//		// println obj.a
	//		//
	//		//		assertThat(GlobalVariable.G_SiteURL, hasItem(allOf(
	//		//			hasProperty("name", is("foo")),
	//		//			hasProperty("count", is(1))
	//		//		)));
	//		//
	//	}






	// End of class
}
