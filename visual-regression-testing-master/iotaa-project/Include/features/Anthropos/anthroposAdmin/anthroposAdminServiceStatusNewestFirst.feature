#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
#
# This feature covers cases: 5317

@tag
Feature: Confirm Service Status events are ordered latest to earliest
	Creates 2 new installed orders, invokes a hub offline event for both users, shares Service Status 
	issue with Bristol office and then confirms Service Status events are ordered latest to earliest  

# /////////////////////////////////////////
# Refixture so to normalise the system
# /////////////////////////////////////////
  Scenario: Reset data
  	Given Normalise the dashboard  

	Scenario: Finish feature
  	Then confirm feature is complete

 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Darren in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Dacia in field number 4
	  And Add Custom Script Parameter to Run Script within pumpadmin: value broadband in field number 5
	  And Add Custom Script Parameter to Run Script within pumpadmin: value true in field number 6
  	And I click the run button
		And I ensure that the AppFlow status is complete 

  Scenario: Login to the anthropos admin    
    Given Admin - login with admin.iotaa    
    And 'Frequent Tasks' is visible on screen

# /////////////////////////////////////////
# Create users for this test
# /////////////////////////////////////////

	Scenario: Select Darren Dacia in IoT Test tool		
		And Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select Darren Dacia from the drop down list with the attribute name and value client		
		And Pump IoT: I click the button, which contains the attribute name and value continue

	Scenario: Run background event for Darren Dacia
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
		And Pump IoT: I select All Devices from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Background event from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 00:03 in the input field with the attribute id and value time_1
		And Pump IoT: I uncheck the checkbox with the attribute id and value heartbeat
		And Pump IoT: I uncheck the checkbox with the attribute id and value zwave
		And Pump IoT: I select Check for Active Incidents from the drop down list with the attribute id and value job
		And Pump IoT: I click button with the attribute value and value Run		
		
	Scenario: Switch back to Anthropos admin dashboard
		Given I switch to browser tab 0
		# And I confirm Admin IoTAA is visible
		And 'Frequent Tasks' is visible on screen
    
	Scenario: Manage Service Issue
		Given I select Manage Service Issues from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow

	Scenario: Confirm Darren Dacia hub has gone offline is visible
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Darren Dacia is visible
		And 'Darren Dacia' is visible on screen
		
		And I select Darren Dacia Hub offline from the Issue to manage drop down list
		And I click next
		
	Scenario: Share Darren Dacia Hub offline issue with Office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Manage Issue: Darren Dacia Hub offline is visible
		And 'Darren Dacia Hub offline' is visible on screen
				
		# And I select Share with Bristol from the Choice drop down list
		Then I select the item, with the text partially containing: .*Bristol.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Enter message and share action with Office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Share action is visible
		And 'Share action' is visible on screen
		
		# And I enter Darren Dacia Hub offline - please investigate in the Action Message field
		Then I select the item, with the text partially containing: .*Bristol.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Confirm incident has been shared with Bristol
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Incident Shared with Bristol is visible
		And 'Incident Shared with Bristol' is visible on screen
		
		
# // ########################################################################################################
# // Create a new installation order so that we can check the latest event appears at top Service Status list
# // ########################################################################################################
	
 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Bobby in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Bugatti in field number 4
	  And Add Custom Script Parameter to Run Script within pumpadmin: value broadband in field number 5
	  And Add Custom Script Parameter to Run Script within pumpadmin: value true in field number 6
  	And I click the run button
		And I ensure that the AppFlow status is complete 

  Scenario: Login to the anthropos admin    
    Given Admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen

	Scenario: Select Bobby Bugatti in IoT Test tool		
		And Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select Bobby Bugatti from the drop down list with the attribute name and value client		
		And Pump IoT: I click the button, which contains the attribute name and value continue

	Scenario: Run background event for Bobby Bugatti
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
		And Pump IoT: I select All Devices from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Background event from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 00:05 in the input field with the attribute id and value time_1
		And Pump IoT: I uncheck the checkbox with the attribute id and value heartbeat
		And Pump IoT: I uncheck the checkbox with the attribute id and value zwave
		And Pump IoT: I select Check for Active Incidents from the drop down list with the attribute id and value job
		And Pump IoT: I click button with the attribute value and value Run		
		
	Scenario: Switch back to Anthropos admin dashboard
		Given I switch to browser tab 0
		And 'Frequent Tasks' is visible on screen
    
	Scenario: Manage Service Issue
		Given I select Manage Service Issues from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow

	Scenario: Confirm Bobby Bugatti hub has gone offline is visible
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Bobby Bugatti is visible
		And 'Bobby Bugatti' is visible on screen
		
		And I select Bobby Bugatti Hub offline from the Issue to manage drop down list
		And I click next
		
	Scenario: Share Bobby Bugatti Hub offline issue with Office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Manage Issue: Bobby Bugatti Hub offline is visible
		And 'Manage Issue' is visible on screen
						
		# And I select Share with Bristol from the Choice drop down list
		Then I select the item, with the text partially containing: .*Bristol.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Enter message and share action with Office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Share action is visible
		And 'Share action' is visible on screen
		
		And I enter Bobby Bugatti Hub offline - please investigate in the Action Message field
		And I click next
		
	Scenario: Confirm incident has been shared with Bristol
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Incident Shared with Bristol is visible
		And 'Incident Shared with Bristol' is visible on screen

# // #####################################################################################		
# // Check Service Status table and confirm the latest event is at the top of the table
# // #####################################################################################

  Scenario: Login to the anthropos admin    
    Given Admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen

  Scenario: In the anthropos admin dashbaord, confirm the latest Service Status event is at the top of the list (covers case: 5317)
    And I confirm table cell content 'contains': 00:05:00, located by row number 2 and column 5, whose ancestor element contains attribute params and value serviceStatus
    And I confirm table cell content 'contains': 00:03:00, located by row number 3 and column 5, whose ancestor element contains attribute params and value serviceStatus

  Scenario: Login to the bristol office     
    Given Office - login with bristol.office
    And 'Frequent Tasks' is visible on screen 

  Scenario: In the bristol office dashbaord, confirm the latest Service Status event is at the top of the list (covers case: 5317)
  	# Given I confirm service status is visible
    And I confirm table cell content 'contains': 00:05, located by row number 2 and column 6, whose ancestor element contains attribute data-ui-test and value servicestatus
    And I confirm table cell content 'contains': 00:03, located by row number 3 and column 6, whose ancestor element contains attribute data-ui-test and value servicestatus
 	
# /////////////////////////////////////////
# Refixture so to normalise the system
# /////////////////////////////////////////

  Scenario: Reset data
  	Given Normalise the dashboard  

	Scenario: Finish feature
  	Then confirm feature is complete  	