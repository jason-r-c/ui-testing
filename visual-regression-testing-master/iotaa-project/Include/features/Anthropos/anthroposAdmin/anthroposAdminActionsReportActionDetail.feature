# Author: jason.carney@anthropos.io

# Keywords Summary :
#
# 9536 Concept of client tags: Adds demo client tag:
# add a client tag, add a client tag, client tag used for filtering

# This feature covers cases: 4533, 5346, 5504, 5543, 9574

Feature: Action detail included in actions report
  Generate Wandering and No Morning Activity events which appears in the Action Report (admin.iotaa dashboard)

	9574 Ability to filter reports by client tag:
	Sets Demo Client tag for John Jenkins, then checks this filter works when running the Actions Report.
	Then also runs with installer training filter to confirm John Jenkins is not displayed.
	
	9536 Concept of client tags: Adds demo client tag:
	Adds the default (on test servers) demo client tag to John Jenkins within Client Administration
	
	## // Case 9574: Ability to filter reports by client tag - START
	##
	## // Description 
	## A brief outline of the story should be added.
	####################################################################################################

	Scenario: Login to Anthropos dashboard
		Given Anthropos dashboard - login with admin.iotaa
    Then 'Frequent Tasks' is visible on screen
				
 	Scenario: Run Client Administration task
		And I select Client Administration from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 		
    
	Scenario: Select customer "Home Instead"
		Given 'Select customer' is visible on screen	
  	Then I select Home Instead from the Customer selectable items in the Select customer appflow
  	And I click next
  	
	Scenario: I select "Bristol" from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next			
		
	Scenario: I select "John Jenkins" from the Clients single select appflow panel
		## Then 'John Jenkins' is visible on screen
		Then I confirm 'John Jenkins' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.admin.clientAdmin.internal'		
		Then select row John Jenkins from single select appflow panel
		
	Scenario: Click edit link for: Scenario Configuration 
  	And 'Third-party IDs' is visible on screen
  	And I click the button html element, whose ancestor element contains attribute name and value editAccountDetails 
  	
	## // Case 9536: Concept of client tags: Adds demo client tag
	Scenario: select an option within the pop-up/dropdown UI component displayed				
		Then Add demo client to input field whose ancestor element contains attribute name and value tags			
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'tags', click the 'enter' key
		Then I confirm 'Demo Client' is visible within the screen whose ancestor contains attribute 'name' and value 'tags'	
		And I click next
		
	## // Case 9574: Ability to filter reports by client tag - END
	####################################################################################################	

	## 5504: No morning activity called 'morning activity' in actions report - START
	####################################################################################
	
	Scenario: Select John Jenkins in IoT Test tool		
		And Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute name and value client		
		And Pump IoT: I click the button, which contains the attribute name and value continue  	

	Scenario: Run background event for John Jenkins
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
		
		And Pump IoT: I select enabled from the drop down list with the attribute id and value clientPackageStatus
		And Pump IoT: I select enabled from the drop down list with the attribute id and value franchisePackageStatus
		
		# Bedroom device 1
		And Pump IoT: I select Bedroom Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Motion Sensor movement on from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Yesterday from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter 20:00 in the input field with the attribute id and value time_1
		
		# Bedroom device 2
		And Pump IoT: I select Bedroom Motion Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Motion Sensor movement off from the drop down list with the attribute id and value event_2
		And Pump IoT: I select Yesterday from the drop down list with the attribute id and value day_2
		And Pump IoT: I enter 20:10 in the input field with the attribute id and value time_2
		
		# All devices
		And Pump IoT: I select All Devices from the drop down list with the attribute id and value device_3
		And Pump IoT: I select Background event from the drop down list with the attribute id and value event_3
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_3
		And Pump IoT: I enter 06:00 in the input field with the attribute id and value time_3		
		And Pump IoT: I enter 13:00 in the input field with the attribute id and value desiredTime
		And Pump IoT: I select No Morning Activity (Per Client) from the drop down list with the attribute id and value job
		And Pump IoT: I click button with the attribute value and value Run	

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen

	Scenario: Select and run Actions Report
		Given I select Actions Report from the drop down list in the sidebar appflow for All Available Reports
		And click on sidebar Run Report button
	
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office		
		And 'Select office' is visible on screen		
		And I select Bristol in the Office multi select list
		And I click next		

	Scenario: Enter details for generating Actions Report
		And 'Enter details for generating Actions Report' is visible on screen		
		And I select All Users in the Client multi select list
		Then I select the item, with the text partially containing: .*Include.* , from the drop down list with the attribute name and value clientTagFilter_row00_incExc
		Then I select the item, with the text partially containing: .*demo.* , from the drop down list with the attribute name and value clientTagFilter_row00_value		
		And I click next		

	Scenario: Confirm Event Description in Action Report (covers cases 4533, 5346, 5504, 9574)	
		## Confirm the Client Tag 'Demo Client' is displayed 
		Given 'Demo Client' is visible on screen
		
		## Confirm No Activity is displayed
		And 'Action taken by office/on call' is visible on screen		
		And I confirm table cell content 'is exactly': No morning activity, located by row number 2 and column 8, whose ancestor element contains attribute name and value table
		
		## Check details of alert
		And I confirm table cell content 'contains': No activity detected before 11:00, located by row number 2 and column 9, whose ancestor element contains attribute name and value table
		
		## Head back a screen
		Then I click back
		
	Scenario: Select Installer Training filter/tag so to prove no client is displayed (covers case 9574)
		And 'Enter details for generating Actions Report' is visible on screen		
		And I select All Users in the Client multi select list
		Then I select the item, with the text partially containing: .*Include.* , from the drop down list with the attribute name and value clientTagFilter_row00_incExc
		Then I select the item, with the text partially containing: .*installer training.* , from the drop down list with the attribute name and value clientTagFilter_row00_value		
		And I click next		
		
	Scenario: Confirm no clients are displayed 
		Given 'John Jenkins' is visible on screen
		
	## 5504: No morning activity called 'morning activity' in actions report - END
	####################################################################################		
		
	## Refixture so to normalise the system
	####################################################################################

  Scenario: Reset data
  	Given Normalise the dashboard  

	Scenario: Finish feature
  	Then confirm feature is complete  			
		
	## Generate dummy Wandering alert and confirm in Actions Report 
	####################################################################################

  Scenario: Generate Wandering at night alert from Pump Admin
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.WanderingAtNightScript script
  	And I click the run button
  	And I ensure that the AppFlow status is complete
  	
  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa    
		And 'Frequent Tasks' is visible on screen

	Scenario: Select and run Actions Report
		Given I select Actions Report from the drop down list in the sidebar appflow for All Available Reports
		And click on sidebar Run Report button
	
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office
		And 'Select office' is visible on screen		
		And I select Bristol in the Office multi select list
		And I click next		

	Scenario: Enter details for generating Actions Report
		And 'Enter details for generating Actions Report' is visible on screen		
		And I select John Jenkins in the Client multi select list		
		And I click next		

	Scenario: Confirm Event Description in Action Report (covers cases 4533, 5346, 5504)		
		And 'Action Report' is visible on screen
		And I confirm table cell content 'is exactly': Wandering, located by row number 2 and column 8, whose ancestor element contains attribute name and value table
		
	