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
@tag
Feature: Local Office Notifications
  Check that additional content for the Notifications card can be shown / hidden 

  @tag1
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree  	
    
  Scenario: collapse Notifications card so to hide content
   	Given collapse Notifications container    
    
  Scenario: uncollapse Notifications card so to display content
    Given expand Notifications container   	
