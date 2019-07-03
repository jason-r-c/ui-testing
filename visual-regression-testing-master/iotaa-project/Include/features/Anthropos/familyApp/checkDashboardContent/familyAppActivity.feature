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
Feature: Title of your feature
  I want to use this template for my feature file

  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree
    
  Scenario: Press Activity
    Given i click the movement package button
    And the movement screen is displayed
    And the movement app date selector is displayed
    And movement data-lozenge displayed for day summary
    And movement data-lozenge displayed for In Bed
    And movement data-lozenge displayed for In Chair   	   
   	And movement activity graph button is displayed
   
  Scenario: Back to home
    Given from movement screen click back to Family App home screen
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed  