
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
Feature: Family App Hydration testing
  I want to use this template for my family app hydration
  # Note, this just checks for basic navigation and presence of assets
  
  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree
    
  Scenario: Press Hydration
    Given i click the hydration package button
    And the hydration screen is displayed
    And the hydration app date selector is displayed
    And hydration data-lozenge displayed for day summary
    And hydration data-lozenge displayed for kettle usage during the day
   	And hydration data-lozenge displayed for Bathroom visits during the day   
   	And hydration activity graph button is displayed
   
  Scenario: Back to home
    Given from hydration screen click back to Family App home screen
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed     
