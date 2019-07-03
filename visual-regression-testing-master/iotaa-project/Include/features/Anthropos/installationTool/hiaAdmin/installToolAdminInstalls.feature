#Author: chris.covell@anthropos.io
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

Feature: Manage new install requests 
  Manage new Install
  
  Scenario: Login as Install Admin
    Given HIA Admin - login with henry.admin
		Then I confirm Installations is visible		
		
	Scenario: Assign order				
		And I click the manage button in the installations table 		
		And I select Assign installation to installer from the Option drop down list
		And I click next		
		And I select Henry Admin from the Installer drop down list
		And I click next
		And click back in header console to head back to dashboard home screen
		
	Scenario: Confirm Configuration request		
		Given I confirm the text 001-00001 resides in container My Installations
			
	Scenario: Finish feature
		Then confirm feature is complete
		
		
		