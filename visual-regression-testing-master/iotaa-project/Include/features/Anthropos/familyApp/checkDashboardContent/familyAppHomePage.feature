#Author: chris.covell@anthropos.io
#Keywords Summary : Functional testing of the Family App
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
Feature: Funtional testing of Family App Homepage
  I want to use this template for my Family App Homepage testing
  # Note, this just checks for basic navigation and presence of assets
  
  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree    

  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed 
  
  Scenario: Can i see the help and settings buttons
    Given info and settings buttons are displayed
  
  Scenario: Can I see the Circle
    Given circle message is displayed 
      
  Scenario: Can I see the alert
    Given alerts message is displayed
    And more button is displayed
    And alert text is displayed
    
  Scenario: Can I see packages
    Given Hydration, Nutrition, Activity, Environment buttons are displayed  
    
  Scenario: Can I see the alerts list
    Given alerts list title is displayed
    And alerts list summary is displayed
    
  Scenario: Can I see the actionable insights list
    Given actionable insights list title is displayed
    And actionable insights list summary is displayed