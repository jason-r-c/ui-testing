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
@tag
Feature: Install Tool

##########################
### ** Testing area ** ###
##########################
#	@tagplayground
#	Scenario: testing playground
#		# Given 007
#		Given now i have changed the click me step definition

##########################################################################################		
# @JC: this can be commented out during development for quickly testing the dashboard

	@tag0
	Scenario: Save Iotaa fixture
		Given that I go to PumpAdmin fixtures list
		And I select Iotaa fixture
		And drop the database
		And confirm the password
		Then click submit to refixture.
		

	@tag1
	Scenario: Run PumpAdmin setup demo script
		Given that I go to PumpAdmin
		And I select SetupDemoScript
		And I click the run button
		Then ensure that the app flow status is complete 
		
	@tag2
	Scenario: Run PumpAdmin order and preinstall script
		Given that I go to PumpAdmin
		And I select NewAnthroposOrderAndPreInstallScript
		And I click the run button
		Then ensure NewAnthroposOrderAndPreInstallScript successfully run 
		
# @JC: // END of comment area
##########################################################################################

# @JC 3/3/19: login to installer dashboard here!!! ##
	@tag4
	Scenario: Install Tool Logon	 
		Given that I go to the test environment
		And I enter the username ian.install
		And enter the password password
		And I click the login button
		Then ensure the dashboard is visible
#
##########################################################################################	
# @JC: this can be commented out during development for quickly testing the dashboard

	@tag5
	Scenario: Install Tool Select Client	
		Given that I select the client drop down icon
		And I select start
		And I select Accept Installation Request from the drop down menu
		And I click next
		Then ensure that client is moved into My Install Requests column
		
# @JC: // END of comment area
##########################################################################################	

	@tag6
	Scenario: Install Tool Client Details		
		Given that I select the client drop down icon
		And I select open
		Then ensure that client details are displayed on screen  
	
	@tag7
	Scenario: Install Tool Inventory	
		# Given I select next
		Given I click next
		Then ensure that a list of client devices are displayed on screen
		And that I select the drop down		
		# And I select next
		And I click next
		
		
	@tag3
	Scenario: Install Tool Install Hub		
		##// And I select next
		Given I configure Hub 
		And I go to PumpHouse IoT Test Tool
		And I Iot test select client
		And I select continue
		And I run a hub background event for the current time
		Then ensure that the Hub displays activity
		
	@tag8
	Scenario: Install Tool Device Selection
		# Given I select next
		Given I click next
		And I select the device dropdown
		And I select Bathroom PIR
		# And I select next
		# And I select next
		And I click next
		And I click next
		
		## Install device
		And I go to PumpHouse IoT Test Tool
		And I Iot test select client
		And I select continue
		And I run a bathroroom motion sensor event for the current time
	
		## test device
		# And I select next
		# And I select next
		And I click next
		And I click next
		And I select Test Device
		# And I select next
		And I click next		
		
		And I go to PumpHouse IoT Test Tool
		And I Iot test select client
		And I select continue
		And I test bathroom PIR
		Then I confirm the device has been tested
		
	@tag10
	Scenario: Close the feature
		Then close the browser
		
	
		