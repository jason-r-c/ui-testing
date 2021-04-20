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
# This feature covers cases: 5307

@tag
Feature: Run Family app details report
	Check that the Family app details report can be ran, and displays expected table headings

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa
    
    # JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
    # And I confirm admin iotaa is visible
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Family App Stats Report
		Given I select Family App Stats Report from the drop down list in the sidebar appflow for All Available Reports
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
		And 'All Users' is visible on screen
		
		And I select All Users in the Client multi select list
		And I click next
		
	Scenario: Confirm Family App Stats Report screen is displayed (covers case 5307)		
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# And I confirm Microwave Count is visible
		And 'Microwave Count' is visible on screen
		
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# And I confirm Avg Times out of Chair is visible
		And 'Avg Times out of Chair' is visible on screen
		
 