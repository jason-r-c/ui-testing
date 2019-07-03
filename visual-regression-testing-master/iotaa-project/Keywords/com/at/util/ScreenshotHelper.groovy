package com.at.util

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.awt.image.BufferedImage

import javax.imageio.ImageIO

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
import ru.yandex.qatools.ashot.comparison.ImageDiff
import ru.yandex.qatools.ashot.comparison.ImageDiffer
import MobileBuiltInKeywords as Mobile
import WSBuiltInKeywords as WS
import WebUiBuiltInKeywords as WebUI

// Get the date and time
import java.text.SimpleDateFormat

// try to get RunConfiguration working
import com.kms.katalon.core.configuration.RunConfiguration

public class ScreenshotHelper {

	@Keyword
	public boolean compareImages() {

		// Get yesterdays screenshot
		BufferedImage groundtruth = ImageIO.read(new File(RunConfiguration.getProjectDir() + "/screenshots/groundtruth.png"))

		println "read in groundtruth: " + groundtruth
		println "\n"

		// Take screenshot of the dashboard
		WebUI.takeScreenshot(RunConfiguration.getProjectDir() + "/screenshots/current.png")

		// Load in the screenshot we just took
		BufferedImage todaysScreenshot = ImageIO.read(new File(RunConfiguration.getProjectDir() + "/screenshots/current.png"))
	
		println "read in todaysScreenshot: " + todaysScreenshot
		println "\n"

		// Compare the 2 screenshots
		ImageDiffer imgDiff = new ImageDiffer()
		ImageDiff diff = imgDiff.makeDiff(groundtruth, todaysScreenshot)
		// BufferedImage diffImage = diff.getMarkedImage(); // comparison result with marked differences. see https://github.com/yandex-qatools/ashot

		println "diff.hasDiff() is: " + diff.hasDiff()
		
		if( diff.hasDiff() == false ) {
			println "The screenshots are identical - there is no difference" 
			
		} else {
			println "The screenshots are different -  diff.hasDiff() is: " + diff.hasDiff()
			
		}

		return diff.hasDiff()
		
		/* Legacy code */
		
		// def keyword appears to work when used in a class method
		// resource: https://stackoverflow.com/questions/39360085/get-current-date-and-time-in-groovy
		//def today = new Date()

		// take away one date from today
		// resource: https://stackoverflow.com/questions/8816990/subtract-a-date-by-1-or-2-in-groovy
		//def yesterday = today - 1
		//println yesterday.format("dd-MM-yyyy")

		//def sdf = new SimpleDateFormat("dd-MM-yyyy") // to add hours, mins, secs - HH-mm-ss
		//println sdf.format(today)

		//println "\n"
		//println "Yesterdays date was: " + RunConfiguration.getProjectDir() + "/screenshots/sc_" + yesterday.format("dd-MM-yyyy") + ".png \n"
		//println "Todays date is: " + RunConfiguration.getProjectDir() + "/screenshots/sc_" + sdf.format(today) + ".png \n"
		//println "The current project folder is: " + RunConfiguration.getProjectDir() + "\n"
	}

}
