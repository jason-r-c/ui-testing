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
Feature: Create content for Service status and First morning activity

	# Reset pumphouse time to 9am
	Scenario: Set the time in PumpHouse to 9am so we are using office hours 
		Given reset pumphouse time to 9 hundred hours
	
	# Create First morning activity content
	Scenario: Create First morning activity card content using iot test tool
		Given navigate to iot test tool

	# Create Service Status card content
  Scenario: Login to the Head Office to start Service Status card content creation process
    Given login to Head Office as admin.iotaa using onetwothree

	Scenario: Create Service Status card content
    And click on sidebar Apps button    
    And click on Iotaa.adminNav tile    
    And I select Manage Hub State from the drop down list in the Admin tasks appflow 
    And I click next in the Admin tasks appflow    
    And I select Home Instead from the Customer selectable items in the Select customer appflow
    And I click next in the Select customer appflow 
    And select Bristol in the main Select local office multi select form appflow    
    And I click next in the Select local office appflow    
    And select John in the secondary Client multi select form appflow    
    And I click next for the Client secondary appflow    
    And I select Pause hub in the drop down list in the Client John Jenkins secondary appflow    	 
    And I click next for the Client secondary appflow    
    And input some message text into Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
