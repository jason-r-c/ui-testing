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

Feature: Manage an order 
  Check that we can manage an order
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree
    
  Scenario: Select Manage Client Config
    Given I select Manage Client Configuration from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow

  Scenario: Select Client
		Given I select John Ferrari from the Client drop down list
		And I click next in the Please select client to configure appflow
		
	Scenario: accept defaults
	  Given I click next in the Standard Scenarios appflow
	  And I click next in the Service Issues appflow
	  