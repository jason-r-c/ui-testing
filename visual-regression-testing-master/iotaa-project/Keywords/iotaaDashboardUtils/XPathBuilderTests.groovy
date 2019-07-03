package iotaaDashboardUtils

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
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

// @JC 26/6/19 custom import
import java.io.*

// @JC 26/6/19
import javax.xml.parsers.DocumentBuilder
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.xpath.XPath
import javax.xml.xpath.XPathConstants
import javax.xml.xpath.XPathExpression
import javax.xml.xpath.XPathFactory

import org.w3c.dom.Document
import org.w3c.dom.NodeList

import groovy.json.JsonOutput

public class XPathBuilderTests {

	// @Test
	void assertXpathQuery(){
		// Build DOM
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true); // never forget this!
		DocumentBuilder builder = factory.newDocumentBuilder();

		// Read in the html file
		Document doc = builder.parse("/Users/jasoncarney/repository/anthropos-test-html/anthropos.html");

		// Create XPath objects so we can use xpath
		XPathFactory xpathfactory = XPathFactory.newInstance();
		XPath xpath = xpathfactory.newXPath();
		
		// Compile the xpath query to see whether it is found or not
		XPathExpression expr = xpath.compile("//*[contains(@class,'btn') and text()='Configure Admin Alerts by Email/SMS']");
		Boolean result = expr.evaluate(doc, XPathConstants.BOOLEAN);
		println '\r xpath query found: '+result+'\r'
		
		assert result == true	
	}
}
