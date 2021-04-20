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
# This feature covers cases: 4602, 4669
@tag
Feature: Notification to Anthropos support for completed install
  Adds user to Anthropos Test Support Team, runs order and install script and confirms installation email was sent

# // Set permissions for Admin to receive installation emails ////////////////////////////////////////////////////////////////////////////////////////////////////
  Scenario: Log on as Admin 
  	Given Head Office - login with admin.iotaa
  	And 'Frequent Tasks' is visible on screen
  	
	Scenario: Select and Office Users Administration appflow 
  	Then I select Add User to Anthropos Test Support Team from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow  	

	Scenario: Confirm Select and Office Users Administration appflow screen is visible
		# Given I confirm name is visible
		And 'postcode' is visible on screen
		And Add admin to input field whose ancestor element contains attribute name and value fn
		And I click next

	Scenario: Confirm select account to grant admin permissions to screen is visible
		# Given I confirm select account to grant admin permissions to is visible
		And 'select account to grant admin permissions' is visible on screen
		And I select Admin in the account multi select list
		And I click next
		
	Scenario: Confirm home screen is visible
		# Given I confirm Admin IoTAA is visible
		And 'Frequent Tasks' is visible on screen
		
# // Clear previous emails first ////////////////////////////////////////////////////////////////////////////////////////////////////		
	Scenario: Confirm we are on the Pump Admin home page
		Given I navigate to PumpAdmin Scripts list
		# And I confirm Run Script is visible
		And 'Run Script' is visible on screen  
		
	Scenario: Clear previously sent emails		
		Given Pump Admin: I select the main menu item Debug
		# And I confirm Debugging is visible
		And 'Debugging' is visible on screen
		And Pump Admin: I click the element with the attribute name and value _action_clearEmail
		
	Scenario: Confirm emails are cleared		
		# Given I confirm cleared is visible
		# And 'cleared' is visible on screen			
		And I click back in the browser
	
	Scenario: Move to scripts page	
		# Given I confirm Debugging is visible
		And 'Debugging' is visible on screen	
		And Pump Admin: I select the main menu item Scripts	

# // Run the order and install script ////////////////////////////////////////////////////////////////////////////////////////////////////
	Scenario: Run NewAnthroposOrderAndInstallScript script
		# Given I confirm Run Script is visible
		And 'Run Script' is visible on screen	
		And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script
		And I click the run button

# And I wait 600 seconds before moving to the next step


		
	Scenario: Confirm executed script com.pumpco.iotaa.NewAnthroposOrderAndInstallScript
		# Given I confirm executed script com.pumpco.iotaa.NewAnthroposOrderAndInstallScript is visible
		# And 'executed script com.pumpco.iotaa.NewAnthroposOrderAndInstallScript' is visible on screen
		And I navigate to PumpAdmin Scripts list
		
	Scenario: Prepare to view the email message	
		# Given I confirm Run Script is visible
		And 'Run Script' is visible on screen	  
		And Pump Admin: I select the main menu item Debug
		
	Scenario: View the email message
		# And I confirm Debugging is visible
		And 'Debugging' is visible on screen		
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
	
# // Confirm installation email sent ////////////////////////////////////////////////////////////////////////////////////////////////////	
	Scenario: Confirm installationemail sent (covers case 4602. Partially covers 4669)
		# Given I confirm All Devices were installed is visible
		And 'All Devices were installed' is visible on screen

		
		