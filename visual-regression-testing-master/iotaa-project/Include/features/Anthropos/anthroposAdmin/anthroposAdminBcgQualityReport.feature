#Author: jason.carney@anthropos.io
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
# This feature covers cases: 5247

@tag
Feature: Run BCG quality report
	Check that the BCG quality report can be ran, and displays expected table headings

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa
    
    # JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
    # And I confirm admin iotaa is visible
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Family App Stats Report
		Given I select BCG Quality Report from the drop down list in the sidebar appflow for All Available Reports
		And click on sidebar Run Report button
 
	Scenario: Select Home Instead customer
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Select customer is visible
		And 'Select customer' is visible on screen
		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select Bristol office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Select office is visible
		And 'Select office' is visible on screen
		
		And I select Bristol in the Office multi select list
		And I click next		
		
	Scenario: Select all users and default to yesterdays date
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Family App Stats Report is visible		
		And 'Select client whose bcg quality you wish to measure' is visible on screen
		
		And I select John Jenkins in the Client multi select list
		And I click next
		
	Scenario: Accept default values in the BCG Quality Report
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm BCG Quality Report is visible
		And 'Min % good durations' is visible on screen
		
		Then I click next 
		
	Scenario: Confirm BCG Quality Report Report screen is displayed (covers case 5247)
	
		# Given I confirm BCG Quality Report is visible
		
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# And I confirm Num times is visible
		And 'Num times' is visible on screen
		
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# And I confirm Good/Bad Durations is visible
		And 'Good/Bad Durations' is visible on screen
		
		
		
 