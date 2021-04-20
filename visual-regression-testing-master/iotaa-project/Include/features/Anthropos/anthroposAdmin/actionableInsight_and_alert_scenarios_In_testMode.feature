# Author: jason.carney@anthropos.io

# Keywords Summary: 
# 
# generate test actionable insight / create test actionable insight, generate TEST insight,
# 
# generate temperature actionable insight / create temperature actionable insight, display test actionable insight in Notifications card
# 
# set devices as live / set devices as live x days ago, add Admin to Anthropos Test Support Team

# This feature covers cases: 
# 4353, 5066, 9181

Feature: Actionable insight scenario and alert in test mode
  Invoke a test insight and an alert on the admin.iotaa dashboard
  
  4353 Actionable insight scenarios in test mode are sent to Callum/Frances dashboard
  Sets TEST insights to go the Anthropos Admin dashboard, then generate an insight via the
  IOT tool. This will then displayed in the Anthropos Admin dashboard (admin.iotaa user).
  NOTE: - Alerts and Insights that are enabled, go to the Office dashboard.
	- Alerts and Insights that are in TEST mode, (and have a user added to Anthropos Test Support Team), 
	go to the Anthroops Admin dashboard.
  
  5066 Insights only look at data since devices installed:
  Adds 3 to pump IOT tool > devices live, so to prove insights only work for devices that have 
  been live for a period of time.
  
  9181 Expand Too Long in High Risk Area to Too Long in Room:
  Set too long in room rule on bathroom pir, then generates a TEST alert in the Anthropos admin dash. 
  
    
	## // Log on as Admin and select Add User to Anthropos Test Support Team
	####################################################################################################  
	
  Scenario: Login as Anthropos admin
  	Given Head Office - login with admin.iotaa
  	And 'All Available Reports' is visible on screen  	
  	Then I select Add User to Anthropos Test Support Team from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow 
  	
	Scenario: Enter admin into name field		
  	And 'postcode' is visible on screen		
		And Add admin to input field whose ancestor element contains attribute name and value fn
		And I click next
		
	Scenario: Select an account to grant admin permissions to
  	And 'select account to grant admin permissions to' is visible on screen  			
		And I select Admin IoTAA from the account selectable items in the account appflow
		And I click next
		
	Scenario: Confirm we are back on the home screen
		And 'All Available Reports' is visible on screen
				 
	## // Generate a TEST 'temperatue too hot' Actionable Insight 
	####################################################################################################
					 
	Scenario: Select John Jenkins in IoT Test tool		
		And Pump IoT: I go to PumpHouse IoT Test Tool
		And 'Welcome To Pumphouse IoT Testing' is visible on screen		
		And Pump IoT: I select John Jenkins from the drop down list with the attribute name and value client		
		And Pump IoT: I click the button, which contains the attribute name and value continue		
				
	Scenario: Run background event for hub (covers case 5066)
		Given 'Then run job' is visible on screen
		
		## Remove previous iot data
		Then Pump IoT: I check the checkbox with the attribute id and value cleardata		
		
		## Set temperate packages to testing mode
		Then Pump IoT: I select Temperature too hot or too cold - AI from the drop down list with the attribute id and value package
		And Pump IoT: I select testing from the drop down list with the attribute id and value clientPackageStatus
		And Pump IoT: I select testing from the drop down list with the attribute id and value franchisePackageStatus
		
		## Set temperature for living room
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Motion Sensor 30°C from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 00:01 in the input field with the attribute id and value time_1
		And Pump IoT: I enter 01:00 in the input field with the attribute id and value desiredTime
		And Pump IoT: I uncheck the checkbox with the attribute id and value heartbeat
		And Pump IoT: I uncheck the checkbox with the attribute id and value zwave
		
		## Case 5066: Set devices as live since 3 days ago, and 'run job' to Monitor Temperature.
		And Pump IoT: I enter 3 in the input field with the attribute id and value devicesLiveDays		
		And Pump IoT: I select Monitor Temperature from the drop down list with the attribute id and value job	
		And Pump IoT: I click button with the attribute value and value Run			

	Scenario: Login as Anthropos admin
  	Given Head Office - login with admin.iotaa
  	And 'Frequent Tasks' is visible on screen
	
	## Confirm there is a TEST Actionable Insight displayed
	Scenario: Confirm test insight has been generated for Anthropos Admin user
		Given 'John Jenkins has been too hot for the past 3 days' is visible on screen

	## // Case 9181: Expand Too Long in High Risk Area to Too Long in Room - START
	##
	## // Description 
	## See header desription.
	####################################################################################################

	## // Add the Too long in room rule to the Bathroom sensor.
	################################################################################################################
		
 	Scenario: Login as admin.iotaa
		Given Admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen	
		
	Scenario: Run Client Residence task
		And I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow				

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next		
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select John Jenkins from the Client selectable items in the Choose Client to Modify appflow
		Then 'select client whose residence needs to be configured' is visible on screen
		Then I select John Jenkins from the select client whose residence needs to be configured selectable items in the select client whose residence needs to be configured appflow				
		And I click next	
		
	Scenario: Select Edit device rules from Editing Residence: Johns Home screen
		Given 'Editing Residence: Johns Home' is visible on screen
		Then I select the item, with the text partially containing: .*Edit device Rules.* , from the drop down list with the attribute name and value option		
		And I click next
		
	Scenario: Select Too long in room from the Bathroom dropdown menu
		Given 'Slot UUID' is visible on screen
		And Add too long in room to input field whose ancestor element contains attribute name and value deviceTable_row11_rules
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'deviceTable_row11_rules', click the 'ENTER' key 
		And I click next
		And 'Editing Residence: Johns Home' is visible on screen

	## // Generate a TEST 'too long in room'alert 
	####################################################################################################
	Scenario: Select John Jenkins in IoT Test tool		
		And Pump IoT: I go to PumpHouse IoT Test Tool
		And 'Welcome To Pumphouse IoT Testing' is visible on screen		
		And Pump IoT: I select John Jenkins from the drop down list with the attribute name and value client		
		And Pump IoT: I click the button, which contains the attribute name and value continue		
				
	Scenario: Run background event for hub (covers case 5066)
		Given 'Then run job' is visible on screen
		
		## Remove previous iot data
		Then Pump IoT: I check the checkbox with the attribute id and value cleardata		
		
		## Set temperate packages to testing mode
		Then Pump IoT: I select Too long in room - alert from the drop down list with the attribute id and value package
		And Pump IoT: I select testing from the drop down list with the attribute id and value clientPackageStatus
		
		## Set temperature for bathroom
		And Pump IoT: I select Bathroom Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Motion Sensor movement on from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 08:00 in the input field with the attribute id and value time_1
		
		And Pump IoT: I select Bathroom Motion Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Motion Sensor movement off from the drop down list with the attribute id and value event_2
		And Pump IoT: I enter 08:01 in the input field with the attribute id and value time_2
		And Pump IoT: I enter 12:00 in the input field with the attribute id and value desiredTime		
				
		And Pump IoT: I select Too Long in a High Risk Area from the drop down list with the attribute id and value job	
		And Pump IoT: I click button with the attribute value and value Run			

	Scenario: Login as Anthropos admin
  	Given Head Office - login with admin.iotaa
  	And 'Frequent Tasks' is visible on screen		
  	
	## Confirm there is a TEST alert displayed
	Scenario: Confirm test insight has been generated for Anthropos Admin user
		Given 'TEST ALERT: John Jenkins: Too long in Main bathroom' is visible on screen

	## // Case 9181: Expand Too Long in High Risk Area to Too Long in Room - END
	####################################################################################################		