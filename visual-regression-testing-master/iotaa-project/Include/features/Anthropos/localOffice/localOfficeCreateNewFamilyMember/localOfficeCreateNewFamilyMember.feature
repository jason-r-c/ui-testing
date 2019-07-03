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

Feature: Create a new family member 
  Check that we can create a new family member
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree
    
  Scenario: Select a new family member
    Given I select Create new Family Member from the drop down list in the All Available Tasks appflow
    #And I click Run Task  in the All Available Tasks appflow
    
  Scenario: Select Client
  	#Given I select John Jenkins: 39 The Meadows, BS48 3RT tel:016321234566 email:john@example.com
  	And I click next in the Select Client appflow
  	
  Scenario: select new
    #Given I select Add new Family App User from the Choice dropdown in the Current Family App Users: appflow
    And I click next in the Current Family App Users: appflow
    
  Scenario: member details
    #Given I enter Jack in the Forename field in the Add Family Member appflow
    #Given I enter Ferrari in the Surname field in the Add Family Member appflow
    #Given I enter jack.ferrari@test.com in the Email Address field in the Add Family Member appflow
    #Given I enter 01234 567890 in the Mobile Number field in the Add Family Member appflow
    #Given I select Yes from the Receive alerts by text? field in the Add Family Member appflow
    #Given I select No from the Receive alerts by email? field in the Add Family Member appflow  
  	Given I click next in the Add Family Member appflow
  	
  Scenario: Finish
    #Given I see Jack Ferrari in the Current Family App Users: appflow
  	#And I select Done from the Choice dropdown in the Current Family App Users: appflow
    And I click next in the Current Family App Users: appflow
    	
