import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import org.openqa.selenium.Keys

import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory as CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as MobileBuiltInKeywords
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testcase.TestCaseFactory as TestCaseFactory
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testdata.TestDataFactory as TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository as ObjectRepository
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WSBuiltInKeywords
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUiBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable

// @JC 20/05/18: imported so to get the folder check working
import com.kms.katalon.core.configuration.RunConfiguration as RunConfiguration

WebUI.openBrowser('')

WebUI.navigateToUrl('https://www.google.com/?gws_rd=ssl')

// @JC 20/05/18: check if return stops test execution

// println "####### begin check if return stops test execution"
//if( 1 != 1 ) {
//	println  "i didnt expect for this to be true"
//} else {
//	println "going to return now : ) " 
//	return
//}
// println "####### end check if return stops test execution"


// @JC 20/05/18: tutorial is: https://www.mkyong.com/java/how-to-check-if-directory-is-empty-in-java/
//println "####### ( 1 ) Strating check if folder is empty" 
//
//	File screenshotsDirPath = new File( RunConfiguration.getProjectDir() + '/screenshots' );
//	println "screenshotsDirPath is: " + screenshotsDirPath
//	
//	// @JC 20/05/18 tutorial - Groovy check file exists: https://stackoverflow.com/questions/39262999/groovy-file-check
//	def DS_StorePath = RunConfiguration.getProjectDir() + '/screenshots/.DS_Store' 	
//	def DS_StoreFile = new File(DS_StorePath)	
//	
//	// If the DS_StoreFile exists, delete it
//	if( DS_StoreFile.exists() ) {
//		boolean DS_StoreFileSuccessfullyDeleted = DS_StoreFile.delete()		
//		println "DS_StoreFileSuccessfullyDeleted is: " + DS_StoreFileSuccessfullyDeleted		
//	}
//	
//	if(screenshotsDirPath.isDirectory()){	
//		println "screenshotsDirPath.isDirectory() is: " + screenshotsDirPath.isDirectory()		
//		if(screenshotsDirPath.list().length>0){
//			
//			System.out.println("screenshotsDirPath.list().length is: " + screenshotsDirPath.list().length )	
//			System.out.println("Directory is not empty!");
//			return
//				
//		}else{
//				
//			System.out.println("Directory is empty!");
//				
//		}
//		
//	}else{
//			
//		System.out.println("This is not a directory");
//		
//	}
//
//println "####### ( 1 ) ending check if folder is empty"

WebUI.setText(findTestObject('TestingPlayground/googleHomePage/Page_Google/googleInputText'), 'news')
WebUI.sendKeys( findTestObject('TestingPlayground/googleHomePage/Page_Google/googleSearchButton') , Keys.chord(Keys.ENTER))
WebUI.closeBrowser()