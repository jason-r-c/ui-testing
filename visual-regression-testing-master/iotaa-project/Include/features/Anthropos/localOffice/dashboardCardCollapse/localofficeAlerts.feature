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
Feature: Local Office Alerts
  Check that additional content for the Alerts card can be shown / hidden 

  @tag1
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree  	
    
  Scenario: uncollapse Alerts card so to display content
    Given expand Alerts container        
        
	Scenario: check for alert data
    # JCARNEY 14/6/19: We can now target text within a specific container
    Given I confirm the text John Jenkins resides in container Alerts

  Scenario: collapse Alerts card so to hide content
   	Given collapse Alerts container