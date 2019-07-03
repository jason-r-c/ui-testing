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
Feature: Family App Nutrition testing
  I want to use this template for my family app nutrition
  # Note, this just checks for basic navigation and presence of assets
  
  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree
    
  Scenario: Press Nutrition
    Given i click the nutrition package button
    And the nutrition screen is displayed
    And the nutrition app date selector is displayed
    And nutrition data-lozenge displayed for day summary
    And nutrition data-lozenge displayed for Food prepared during the day   	   
   	And nutrition activity graph button is displayed
   
  Scenario: Back to home
    Given from nutrition screen click back to Family App home screen
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed         