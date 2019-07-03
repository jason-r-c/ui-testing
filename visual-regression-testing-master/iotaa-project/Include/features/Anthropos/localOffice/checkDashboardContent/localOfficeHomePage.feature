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
Feature: Login to the Local Office dashboard 
  Check that all UI components display in the Local Office dashboard
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree    
    
  Scenario: Check logo
    Given the Local Office logo is displayed
    
  Scenario: Check header
    Given the Local Office header-console is displayed
    
  Scenario: Check header shortcuts
    Given contacts, notifications, settings, help are displayed
    
  Scenario: Check reports container
    Given Frequent Tasks, All Availiable Tasks, All Available Reports are displayed
    
  Scenario: Check dashboard cards are displayed along with content 
		Given Dashboard cards are displayed with content
		#### note, i want the glue code in here to ensure that they are headings and not buttons!
