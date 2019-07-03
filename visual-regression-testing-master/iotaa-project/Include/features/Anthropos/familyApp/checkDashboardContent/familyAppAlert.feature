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
Feature: Family App Alert
  I want to use this template for my family app alert tests
  # Note, this just checks for basic navigation and presence of assets

  @tag1
  Scenario: Login to the Family App
    Given login to Family App as kathy.dawson using onetwothree
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed     

  Scenario: Press the more button to see Alert
    Given i click the more button on the alerts container
    And the alerts screen is displayed
    And ATTENTION REQUIRED, TO BE ACTIONED and CLOSED separators are displayed 
    
  Scenario: Attention Required
    Given uncollapse the first item listed under attention required
    And attention required alert message text is displayed
    And ACKNOWLEDGE button is displayed
  
  Scenario: Back to home
    Given from alerts screen click back to Family App home screen
    #Check family app homepage is displayed
    
  Scenario: Can I see the HomeInstead logo
    Given the Family App logo is displayed     



