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

Feature: Manage Hub State
  Check that we can manage the state of a hub
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree
    Then I confirm Bristol Office Admin is visible

  Scenario: Select Manage Hub State
    Given I select Manage Hub State from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow
    
  Scenario: Select client
    Given I select John Jenkins in the Client multi select list
    And I click next
    
  Scenario: Pause hub
    Given I confirm Client John Jenkins is visible
    And I select Pause hub from the Action drop down list
    And I click next
   
  Scenario: Accept defualts
		Given I enter Pause text in the Reason for pausing field
  	And I click next
  	And I enter Pause text in the Reason for pausing field
  	And I click next
  
  Scenario: Unpause
  	Given I select Cancel scheduled pause from the Action drop down list
  	And I click next
 
 	Scenario: finish
	  Then click back in header console to head back to dashboard home screen	