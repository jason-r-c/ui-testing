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
Feature: Family App Environment testing
  I want to use this template for my family app environment
  # Note, this just checks for basic navigation and presence of assets
  #
  #Scenario: Login to the Family App
    #Given login to Family App as kathy.dawson using onetwothree
    #
  #Scenario: Press Environment
    #Given I click the "pseudo safety" card Environment button
    #Check Environment title is displayed
    #Check app-date-selector is displayed
    #Check "Day summary", "Avg room temperatures" data-lozenges are displayed
    #Check "View Temperature Graph" button is displayed
    #
  #Scenario: Back to home
    #Given I click the Back button
    #Check family app homepage is displayed
    #
    
######

  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree
    
  Scenario: Press Environment
    Given i click the safety package button
    And the safety screen is displayed
    And the safety app date selector is displayed
    And safety data-lozenge displayed for day summary
    And data-lozenge weather displayed the safety screen
   	And safety data-lozenge displayed for Avg Room Temperatures   
   	And safety temperature graph button is displayed
   
  Scenario: Back to home
    Given from safety screen click back to Family App home screen
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed     